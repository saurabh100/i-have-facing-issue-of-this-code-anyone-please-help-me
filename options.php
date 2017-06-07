<?php
class ControllerProductOptions extends Controller {
	private $error = array();

	public function index() {
		
		if (isset($this->request->get['menuType'])) {
			if($this->request->get['menuType']=='food'){
				$this->getFoodOptions();
			}
			
			if($this->request->get['menuType']=='vendor'){
				$this->getVendorOptions();
			}
			
			if($this->request->get['menuType']=='hall'){
				$this->getHallOptions();
			}
		} else {
			$this->getFoodOptions();
		}
	}
	
		public function displayOptionsPage(){
		//echo 'test123';die;
		
		$this->load->language('product/product');
		$data['button_cart'] = $this->language->get('button_cart');
		$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$data['breadcrumbs'] = array();
		$data['entry_qty'] = $this->language->get('entry_qty');
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('catalog/category');
		//$category_info = array();
		if (isset($this->request->get['path'])) {
			$path = '';
//echo $this->request->get['path'];die;
			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);
			
			
			
			//print_r($category_info);
			if ($category_info) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		if (isset($this->request->get['product_id'])) {
			$data['product_id']=$product_id = (int)$this->request->get['product_id'];
		} else {
			$data['product_id']=$product_id = 0;
		}
		
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		if ($product_info['minimum']) {
			$data['minimum'] = $product_info['minimum'];
		} else {
			$data['minimum'] = 1;
		}

		
		$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}

		$data['text_loading'] = $this->language->get('text_loading');
		$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		//print_r($data);die;
		//$this->response->setOutput($this->load->view('error/not_found', $data));
		$this->response->setOutput($this->load->view('product/product_option', $data));
	}
	
	public function getFoodOptions(){
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		$data['breadcrumbs'] = array();
		$category_info = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		
		$data['breadcrumbs'][] = array(
			'text' => 'Food Menu',
			'href' => $this->url->link('product/options', 'menuType=food')
		);				
		
		$data['entry_qty'] = $this->language->get('entry_qty');
		if (isset($product_info['minimum'])) {
			$data['minimum'] = $product_info['minimum'];
		} else {
			$data['minimum'] = 1;
		}
		
		$data['productIds'] = $this->model_catalog_product->getproductsIds();
		$data['button_cart'] = $this->language->get('button_cart');
		$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions1() as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							//$price = $this->currency->format($this->tax->calculate($option_value['price'], 0, $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
							
							$price = $option_value['price'];
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}
			
		//print_r($data);
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('product/foodoptions', $data));
	}
	
	/*public function getVendorOptions(){
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		$data['breadcrumbs'] = array();
		$category_info = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		
		$data['breadcrumbs'][] = array(
			'text' => 'Vendor Menu',
			'href' => $this->url->link('product/options', 'menuType=vendor')
		);	
		
		$data['options'] = array();
		$optionsArr = $this->model_catalog_product->getOptions();
		foreach ($optionsArr as $option) {
			$option_value_data = array();

			foreach ($option['option_value'] as $option_value) {
				//if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
					if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
						$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
					} else {
						$price = false;
					}

					$option_value_data[] = array(
						//'product_option_value_id' => $option_value['product_option_value_id'],
						'option_value_id'         => $option_value['option_value_id'],
						'name'                    => $option_value['name'],
						'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50)
						//'price'                   => $price,
						//'price_prefix'            => $option_value['price_prefix']
					);
				//}
			}

			$data['options'][] = array(
				//'product_option_id'    => $option['product_option_id'],
				'option_value' => $option_value_data,
				'option_id'            => $option['option_id'],
				'name'                 => $option['name'],
				'type'                 => $option['type']
				//'value'                => $option['value'],
				//'required'             => $option['required']
			);
		}
		//print_r($optionsArr);die;
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('product/vendoroptions', $data));
	}*/
	
	public function getHallOptions(){
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		$data['breadcrumbs'] = array();
		$category_info = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		
		$data['breadcrumbs'][] = array(
			'text' => 'Hall Menu',
			'href' => $this->url->link('product/options', 'menuType=hall')
		);
		
		$data['options'] = array();
		$optionsArr = $this->model_catalog_product->getOptions();
		foreach ($optionsArr as $option) {
			$option_value_data = array();

			/*foreach ($option['option_value'] as $option_value) {
				//if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
					if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
						$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
					} else {
						$price = false;
					}

					$option_value_data[] = array(
						//'product_option_value_id' => $option_value['product_option_value_id'],
						'option_value_id'         => $option_value['option_value_id'],
						'name'                    => $option_value['name'],
						'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50)
						//'price'                   => $price,
						//'price_prefix'            => $option_value['price_prefix']
					);
				//}
			}*/

			$data['options'][] = array(
				//'product_option_id'    => $option['product_option_id'],
				'option_value' => $option_value_data,
				'option_id'            => $option['option_id'],
				'name'                 => $option['name'],
				'type'                 => $option['type']
				//'value'                => $option['value'],
				//'required'             => $option['required']
			);
		}
		//print_r($optionsArr);die;
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('product/halloptions', $data));
	}
	
	public function getSelectedOptionsData(){
		$this->load->model('catalog/product');
		//print_r($this->request->post['']);
		//die;
		
		/*if (!isset($this->session->data['optioncart']) || !is_array($this->session->data['optioncart'])) {
      		$this->session->data['optioncart']['option'] = array();
			$this->session->data['optioncart']['price'] = array();
			$this->session->data['optioncart']['qty'] = array();
			$this->session->data['optioncart']['name'] = array();
    	}*/
		
		if (isset($this->request->post['option'])) {
			$this->session->data['optioncart']['option'] = $optionsIds = $this->request->post['option'];
		}
		
		
		
		if (isset($this->request->post['option_price'])) {
			$this->session->data['optioncart']['price'] = $optionsPrices = $this->request->post['option_price'];
			//$price = $this->currency->format($this->tax->calculate($option_value['price'], 0, $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
		}
		
		if (isset($this->request->post['option_qty'])) {
			$this->session->data['optioncart']['qty'] = $optionsQtys = $this->request->post['option_qty'];
		}
		
		if (isset($this->request->post['option_name'])) {
			$this->session->data['optioncart']['name'] = $optionsNames = $this->request->post['option_name'];
		}
		
		/*print_r($this->session->data['optioncart']['option'][236][0]);
		print_r($this->session->data['optioncart']['price'][236][0]);
		print_r($this->session->data['optioncart']['qty'][236][0]);
		print_r($this->session->data['optioncart']['name'][236][0]);
		
		
		print_r($this->session->data['optioncart']['option'][236][1]);
		print_r($this->session->data['optioncart']['price'][236][1]);
		print_r($this->session->data['optioncart']['qty'][236][1]);
		print_r($this->session->data['optioncart']['name'][236][1]);
		die;*/
		$calc = array();
		
		$data1 = array();
		//print_r($optionsIds);//die;
		foreach($this->session->data['optioncart'] as $optionid => $val){
			if($optionid == 'option'){
				//print_r($this->session->data['optioncart'][$optionid]);
				foreach($this->session->data['optioncart'][$optionid] as $tt =>$j){
					//print_r($tt);
					//print_r($this->session->data['optioncart'][$optionid][$tt]);
					
					$priceArr = $this->session->data['optioncart']['price'][$tt];
					$qtyArr = $this->session->data['optioncart']['qty'][$tt];
					for($n=0;$n<count($j);$n++){
						array_push($calc,$qtyArr[$n] * $priceArr[$n]);
					}
					
					foreach($this->session->data['optioncart'][$optionid][$tt] as $kk => $l){
						//print_r($this->session->data['optioncart'][$optionid][$tt][$kk]);
						$data1 [] = array("optionid"=>$this->session->data['optioncart'][$optionid][$tt][$kk],
											"price"=> $this->session->data['optioncart']['price'][$tt][$kk],
											"name" => $this->session->data['optioncart']['name'][$tt][$kk],
											"qty" => $this->session->data['optioncart']['qty'][$tt][$kk],
											);
					}
				}
			}	 
		}
		 //array_sum($calc);
		//print_r(array_sum($calc));
		//print_r($data1);
		//die;		
		
		//$optionsArr = $this->model_catalog_product->getSelectedOptionsData($optionsIds);
		print_r(JSON_encode(array($data1,array_sum($calc))));die;
	}
}
