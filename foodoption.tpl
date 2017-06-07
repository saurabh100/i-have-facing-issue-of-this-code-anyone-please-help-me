<?php echo $header; 
$categoryName = '';
?>



	<!-- Single Menu Area Start Here -->
            <div class="single-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-md-9 col-sm-9 p-0">
                        	<div id="successmsg" style="display:none;" class="alert alert-success"></div>
						<ul class="breadcrumb">
						<?php foreach ($breadcrumbs as $breadcrumb) { 
							if($breadcrumb['text'] == 'Venue'){
								$categoryName = 'Venue';
							}
							if($breadcrumb['text'] == 'Caterer'){
								$categoryName = 'Caterer';
							}
						?>
						<li>
							<a href="<?php echo $breadcrumb['href']; ?>">
								<?php echo $breadcrumb['text']; ?>
							</a>
						</li>
						<?php } ?>
					</ul>
						
						<?php 
							$vegOptions = array();
							$nonvegOptions = array();
							$foodOptions = array();
							
							$mainCourseOptions = array();
							$welcomeDrinkOptions = array();
							$startersOptions = array();
							$dessertsOptions = array();
							
							$mainCourseOptions1 = array();
							$welcomeDrinkOptions1 = array();
							$startersOptions1 = array();
							$dessertsOptions1 = array();
							
							$i=0;
							$tt = array();
							$pp = array();
							$gg = array();
							$nonvegmenu = array();
							$PopularOptions1 = array();
							$PopularOptions = array();
							//$imagePath = '';
							$image = '';
							//print_r($options);
							foreach ($options as $option) { 						 
								$dd[] = explode("#",$option['name']);
								
								//print_r($dd);
								
								//print_r($nonvegmenu);
								if(isset($dd[$i][2])){
								// print_r($dd[$i][2]);
								$gg[] = $dd[$i][1];
								$tt[] = $dd[$i][2];
								$pp[] = $dd[$i][3];
								}
								
								if(isset($dd[$i][1]) && $dd[$i][1]=='Nonveg'){
									$gg[] = $dd[$i];
								}
								
								if(isset($gg[$i][1]) && is_array($gg[$i])){
								//print_r($gg[$i]); //die;
								$nonvegmenu[] =  $gg[$i][2];
								}
																
								if (strpos($option['name'], 'food#Veg#Beverages') !== false) { 
									$welcomeDrinkOptions[] = $options[$i];	
									$vegBeveragesimage = 'juice.jpg';	
								}
								
								if (strpos($option['name'], 'food#Veg#Starters') !== false) { 
									$startersOptions[] = $options[$i];
									$vegsnacksimage = 'snacks.jpg';
								}
								
								if (strpos($option['name'], 'food#Veg#Main Course' ) !== false) {
									$mainCourseOptions[] = $options[$i];
									$vegmaincourceimage = 'main-course.jpg';
								} 								
								
								if (strpos($option['name'], 'food#Veg#Desserts') !== false) { 
									$dessertsOptions[] = $options[$i];
									$vegdessertsimage = 'desserts.jpg';
								}
								
								if (strpos($option['name'], 'food#Veg#Popular') !== false) { 
									$PopularOptions[] = $options[$i];
									$vegpopularimage = 'popular.jpg';
								}
													
								
								if (strpos($option['name'], 'food#Nonveg#Starters') !== false) { 
									$startersOptions1[] = $options[$i];
									$nonvegstarterimage = 'non-veg-starter.jpg';
								}
								
								if (strpos($option['name'], 'food#Nonveg#Main Course' ) !== false) {
									$mainCourseOptions1[] = $options[$i];
									$nonvegmaincourceimage = 'nonveg-maincourse.jpg';
								} 		

								if (strpos($option['name'], 'food#Nonveg#Popular') !== false) { 
									$PopularOptions1[] = $options[$i];
									$nonvegpopularimage = 'nonveg-popular.jpg';
								}		
								
								$i++;
							}
							//print_r(array_unique($tt));
							//print_r(array_unique($pp));
							//print_r($nonvegOptions);die;
							//print_r($vegOptions);die;							
							//print_r($foodOptions);die;
							
							//print_r($welcomeDrinkOptions);
							//print_r($startersOptions);
							//print_r($mainCourseOptions);
							//print_r($dessertsOptions);
							
							//print_r($welcomeDrinkOptions1);
							//print_r($startersOptions1);
							//print_r($mainCourseOptions1);
							//print_r($dessertsOptions1);
							//die;
						?>
						
						
                         <div class="Tab-bg p-15 text-center">
							<div class="col-xs-6 ">
								<!--<span style="margin-right:15px">
									<input id="vegmenuid" name="vegmenuid" class="vegmenuid" type="radio">
								</span>-->
								<button class="ghost-on-hover-btn white" id="vegButton">
									<i class="icon-buttons-sprite icon-veg m-r-5"></i>VEG MENU
								</button>
							</div>
							<div class="col-xs-6">
								<!--<span style="margin-right:15px">
										<input id="nonvegmenuid" name="nonvegmenuid" class="nonvegmenuid" type="radio">
									</span>-->
								<button class="ghost-on-hover-btn white" id="nonvegButton">
									<i class="icon-buttons-sprite icon-nonveg m-r-5"></i>NON-VEG MENU
								</button>
							</div>
							<div class="clearfix"></div>
						</div>
						
                         <div class="Tab-bg">
                           <!-- Brand Area Start Here -->
						   
						   <div id="vegmenu">
            <div class="brand-area" >
               
                                
                        <div class="rc-carouselNew owl-carousel" 
                            data-loop="false"
                            data-items="6"
                            data-margin="5"
                            data-autoplay="false"
                            data-autoplay-timeout="10000"
                            data-smart-speed="2000"
                            data-dots="false"
                            data-nav="true"
                            data-nav-speed="true"
                            data-r-x-small="2"
                            data-r-x-small-nav="true"
                            data-r-x-small-dots="false"
                            data-r-x-medium="3"
                            data-r-x-medium-nav="true"
                            data-r-x-medium-dots="false"
                            data-r-small="4"
                            data-r-small-nav="true"
                            data-r-small-dots="false"
                            data-r-medium="6"
                            data-r-medium-nav="true"
                            data-r-medium-dots="false"
							data-autoWidth="true"	
							> 
							<?php //if(isset($tt)){?>
							<?php //foreach($tt as $t){?>
							<!--<div class="brand-area-box" style="width:auto;" id="" >
                                <a href="#"><?php //echo $t;?></a>
                            </div>-->
							<?php //} } ?>
							
							<div class="item " style="width:90px"><div class="brand-area-box activetab" id="0">
                                <!--<a href="#">Popular</a>-->
								<span style="">Popular</span>
                            </div></div>
							<div class="item " style="width:100px"><div class="brand-area-box"  id="1">
                                <!--<a href="#">Main Course</a>-->
								<span style="">Main Course</span>
                            </div></div>
							<div class="item" style="width:90px"><div class="brand-area-box" id="2" >
                                <!--<a href="#">Starters</a>-->
								<span style="">Starters</span>
                            </div></div>
							<div class="item vegitem" style="width:90px"><div class="brand-area-box" id="3" >
                                <!--<a href="#">Beverages</a>-->
								<span style="">Beverages</span>
                            </div></div>
							<div class="item vegitem" style="width:90px"><div class="brand-area-box" id="4">
                                <!--<a href="#">Desserts</a>-->
								<span style="">Desserts</span>
                            </div></div>
							<div class="item vegitem" style="width:120px"><div class="brand-area-box" id="5">
                                <!--<a href="#">Thali & Combos</a>-->
								<span style="">Thali & Combos</span>
                            </div></div>
							<div class="item vegitem" style="width:120px"><div class="brand-area-box" id="6">
                                <!--<a href="#">Rice & Biryani</a>-->
								<span style="">Rice & Biryani</span>
                            </div></div>
							<div class="item vegitem" style="width:80px"><div class="brand-area-box" id="7">
                                <!--<a href="#">Wraps</a>-->
								<span style="">Wraps</span>
                            </div></div>
							<div class="item vegitem" style="width:120px"><div class="brand-area-box" id="8">
                                <!--<a href="#">Indian Breads</a>-->
								<span style="">Indian Breads</span>
                            </div></div>
                        </div>  
					</div>  
					
					</div>
					
					
					
            <!-- Brand Area End Here -->
 
 
                         
                         </div>   
                         
                         <div class="Tab-bg p-5">
						 <form id="product" name="frmAllOptions" />
                        <!-- <div class="menu-scroll">-->
						 <!-- start of veg menu-->
						 <div id="vegmenudata">								
						 <?php if(isset($welcomeDrinkOptions)){?>
						 <div class="veg 3" id="c2">
						 
						 <?php foreach ($welcomeDrinkOptions as $option) { ?>
						 <?php if ($option['type'] == 'checkbox') { ?>
									<ul>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
										  <label class="control-label">
										  <?php 
											$dd = explode("#",$option['name']);
											echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[3].'</h2>'; 
											echo '<img src="catalog/view/theme/default/template/assests/img/'.$vegBeveragesimage.'" class="m-b-5">';		
											
										  ?>
										  </label>
										  <div id="input-option<?php echo $option['product_option_id']; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<li>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<?php if ($option_value['image']) { ?>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
													<?php } ?>
													<?php echo $option_value['name']; ?>
													<input type="hidden" name="option_name[<?php echo $option['product_option_id']; ?>][]" class="option-name" value="<?php echo $option_value['name'];?>"/>
												  </label><span class=" pull-right"><span class=" pull-right"><input type="text" name="option_qty[<?php echo $option['product_option_id']; ?>][]" class="no-of-item" value="1"/>
												  
												  &nbsp; x &nbsp;<i class="fa fa-rupee"></i> &nbsp; 
												  <?php if ($option_value['price']) { ?>
												  <input type="hidden" name="option_price[<?php echo $option['product_option_id']; ?>][]" class="option-price" value="<?php echo $option_value['price'];?>"/>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												  </span>
												</div>
											</li>
											<?php } ?>
										  </div>
										</div>
									</ul>
						 <?php } } ?>
						 </div>
						 <?php } ?>
						 
						 <?php if(isset($startersOptions)){?>
						 <div class="veg 2" id="c2">
						 <?php foreach ($startersOptions as $option) { ?>
						 <?php if ($option['type'] == 'checkbox') { ?>
									<ul>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
										  <label class="control-label">
										  <?php 
											$dd = explode("#",$option['name']);
											echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[3].'</h2>'; 
											echo '<img src="catalog/view/theme/default/template/assests/img/'.$vegsnacksimage.'" class="m-b-5">';		
										  ?>
										  </label>
										  <div id="input-option<?php echo $option['product_option_id']; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<li>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<?php if ($option_value['image']) { ?>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
													<?php } ?>
													<?php echo $option_value['name']; ?>
													<input type="hidden" name="option_name[<?php echo $option['product_option_id']; ?>][]" class="option-name" value="<?php echo $option_value['name'];?>"/>
												  </label><span class=" pull-right"><span class=" pull-right"><input type="text" name="option_qty[<?php echo $option['product_option_id']; ?>][]" class="no-of-item" value="1"/>
												  
												  &nbsp; x &nbsp;<i class="fa fa-rupee"></i> &nbsp; 
												  <?php if ($option_value['price']) { ?>
												  <input type="hidden" name="option_price[<?php echo $option['product_option_id']; ?>][]" class="option-price" value="<?php echo $option_value['price'];?>"/>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												  </span>
												</div>
											</li>
											<?php } ?>
										  </div>
										</div>
									</ul>
						 <?php } } ?>
						 </div>
						 <?php } ?>
						 
						 <?php if(isset($mainCourseOptions)){?>
						 <div class = "veg 1" id="c1">
						 
						 <?php foreach ($mainCourseOptions as $option) { ?>
						 <?php if ($option['type'] == 'checkbox') { ?>
									<ul>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
										  <label class="control-label">
										  <?php 
											$dd = explode("#",$option['name']);
											echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[3].'</h2>';
											echo '<img src="catalog/view/theme/default/template/assests/img/'.$vegmaincourceimage.'" class="m-b-5">';												
										  ?>
										  </label>
										  <div id="input-option<?php echo $option['product_option_id']; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<li>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<?php if ($option_value['image']) { ?>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
													<?php } ?>
													<?php echo $option_value['name']; ?>
													<input type="hidden" name="option_name[<?php echo $option['product_option_id']; ?>][]" class="option-name" value="<?php echo $option_value['name'];?>"/>
												  </label><span class=" pull-right"><span class=" pull-right"><input type="text" name="option_qty[<?php echo $option['product_option_id']; ?>][]" class="no-of-item" value="1"/>
												  
												  &nbsp; x &nbsp;<i class="fa fa-rupee"></i> &nbsp; 
												  <?php if ($option_value['price']) { ?>
												  <input type="hidden" name="option_price[<?php echo $option['product_option_id']; ?>][]" class="option-price" value="<?php echo $option_value['price'];?>"/>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												  </span>
												</div>
											</li>
											<?php } ?>
										  </div>
										</div>
									</ul>
						 <?php } } ?>
						 </div>
						 <?php } ?>
						 
						 <?php if(isset($dessertsOptions)){?>
						 <div class = "veg 4" id="c1">
						 
						 <?php foreach ($dessertsOptions as $option) { ?>
						 <?php if ($option['type'] == 'checkbox') { ?>
									<ul>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
										  <label class="control-label">
										  <?php 
											$dd = explode("#",$option['name']);
											echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[3].'</h2>'; 
											echo '<img src="catalog/view/theme/default/template/assests/img/'.$vegdessertsimage.'" class="m-b-5">';												
										  ?>
										  </label>
										  <div id="input-option<?php echo $option['product_option_id']; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<li>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<?php if ($option_value['image']) { ?>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
													<?php } ?>
													<?php echo $option_value['name']; ?>
													<input type="hidden" name="option_name[<?php echo $option['product_option_id']; ?>][]" class="option-name" value="<?php echo $option_value['name'];?>"/>
												  </label><span class=" pull-right"><span class=" pull-right"><input type="text" name="option_qty[<?php echo $option['product_option_id']; ?>][]" class="no-of-item" value="1"/>
												  
												  &nbsp; x &nbsp;<i class="fa fa-rupee"></i> &nbsp; 
												  <?php if ($option_value['price']) { ?>
												  <input type="hidden" name="option_price[<?php echo $option['product_option_id']; ?>][]" class="option-price" value="<?php echo $option_value['price'];?>"/>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												  </span>
												</div>
											</li>
											<?php } ?>
										  </div>
										</div>
									</ul>
						 <?php } } ?>
						 </div>
						 <?php } ?>
						 
						 
						  
						 <?php if(isset($PopularOptions)){?>
						 <div class="veg activetab 0" id="c2">
						 
						 <?php foreach ($PopularOptions as $option) { ?>
						 <?php if ($option['type'] == 'checkbox') { ?>
									<ul>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
										  <label class="control-label">
										  <?php 
											$dd = explode("#",$option['name']);
											echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[3].'</h2>';
											echo '<img src="catalog/view/theme/default/template/assests/img/'.$vegpopularimage.'" class="m-b-5">';		
										  ?>
										  </label>
										  <div id="input-option<?php echo $option['product_option_id']; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<li>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<?php if ($option_value['image']) { ?>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
													<?php } ?>
													<?php echo $option_value['name']; ?>
													<input type="hidden" name="option_name[<?php echo $option['product_option_id']; ?>][]" class="option-name" value="<?php echo $option_value['name'];?>"/>
												  </label><span class=" pull-right"><span class=" pull-right"><input type="text" name="option_qty[<?php echo $option['product_option_id']; ?>][]" class="no-of-item" value="1"/>
												  
												  &nbsp; x &nbsp;<i class="fa fa-rupee"></i> &nbsp; 
												  <?php if ($option_value['price']) { ?>
												  <input type="hidden" name="option_price[<?php echo $option['product_option_id']; ?>][]" class="option-price" value="<?php echo $option_value['price'];?>"/>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												  </span>
												</div>
											</li>
											<?php } ?>
										  </div>
										</div>
									</ul>
						 <?php } } ?>
						 </div>
						 <?php } ?>
						 
						 
						 </div>
						
						 
						 <!-- end of veg menu-->
						 <!-- Start of nonveg menu-->
						 <div id="nonvegmenudata">
						 <?php if(isset($mainCourseOptions1)){?>
						 <div class="nonveg 1" id="c1">
						 <?php foreach ($mainCourseOptions1 as $option) { ?>
						 <?php if ($option['type'] == 'checkbox') { ?>
									<ul>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
										  <label class="control-label">
										  <?php 
											$dd = explode("#",$option['name']);
											echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1]." ".$dd[3].'</h2>'; 
											echo '<img src="catalog/view/theme/default/template/assests/img/'.$nonvegmaincourceimage.'" class="m-b-5">';		
										  ?>
										  </label>
										  <div id="input-option<?php echo $option['product_option_id']; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<li>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<?php if ($option_value['image']) { ?>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
													<?php } ?>
													<?php echo $option_value['name']; ?>
													<input type="hidden" name="option_name[<?php echo $option['product_option_id']; ?>][]" class="option-name" value="<?php echo $option_value['name'];?>"/>
												  </label><span class=" pull-right"><span class=" pull-right"><input type="text" name="option_qty[<?php echo $option['product_option_id']; ?>][]" class="no-of-item" value="1"/>
												  
												  &nbsp; x &nbsp;<i class="fa fa-rupee"></i> &nbsp; 
												  <?php if ($option_value['price']) { ?>
												  <input type="hidden" name="option_price[<?php echo $option['product_option_id']; ?>][]" class="option-price" value="<?php echo $option_value['price'];?>"/>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												  </span>
												</div>
											</li>
											<?php } ?>
										  </div>
										</div>
									</ul>
						 <?php } } ?>
						 </div>	
						 <?php } ?>
						 
						 
						 <?php if(isset($startersOptions1)){?>
						 <div class="nonveg 2" id="c1">
						 <?php foreach ($startersOptions1 as $option) { ?>
						 <?php if ($option['type'] == 'checkbox') { ?>
									<ul>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
										  <label class="control-label">
										  <?php 
											$dd = explode("#",$option['name']);
											echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1]." ".$dd[3].'</h2>'; 
											echo '<img src="catalog/view/theme/default/template/assests/img/'.$nonvegstarterimage.'" class="m-b-5">';												
										  ?>
										  </label>
										  <div id="input-option<?php echo $option['product_option_id']; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<li>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<?php if ($option_value['image']) { ?>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
													<?php } ?>
													<?php echo $option_value['name']; ?>
													<input type="hidden" name="option_name[<?php echo $option['product_option_id']; ?>][]" class="option-name" value="<?php echo $option_value['name'];?>"/>
												  </label><span class=" pull-right"><span class=" pull-right"><input type="text" name="option_qty[<?php echo $option['product_option_id']; ?>][]" class="no-of-item" value="1"/>
												  
												  &nbsp; x &nbsp;<i class="fa fa-rupee"></i> &nbsp; 
												  <?php if ($option_value['price']) { ?>
												  <input type="hidden" name="option_price[<?php echo $option['product_option_id']; ?>][]" class="option-price" value="<?php echo $option_value['price'];?>"/>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												  </span>
												</div>
											</li>
											<?php } ?>
										  </div>
										</div>
									</ul>
						 <?php } } ?>
						 </div>	
						 <?php } ?>
						 
						 <?php if(isset($PopularOptions1)){?>
						 <div class="nonveg activetab 0" id="c2">
						 <?php foreach ($PopularOptions1 as $option) { ?>
						 <?php if ($option['type'] == 'checkbox') { ?>
									<ul>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
										  <label class="control-label">
										  <?php 
											$dd = explode("#",$option['name']);
											echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1]." ".$dd[3].'</h2>';
											echo '<img src="catalog/view/theme/default/template/assests/img/'.$nonvegpopularimage.'" class="m-b-5">';													
										  ?>
										  </label>
										  <div id="input-option<?php echo $option['product_option_id']; ?>">
											<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<li>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
													<?php if ($option_value['image']) { ?>
													<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
													<?php } ?>
													<?php echo $option_value['name']; ?>
													<input type="hidden" name="option_name[<?php echo $option['product_option_id']; ?>][]" class="option-name" value="<?php echo $option_value['name'];?>"/>
												  </label><span class=" pull-right"><span class=" pull-right"><input type="text" name="option_qty[<?php echo $option['product_option_id']; ?>][]" class="no-of-item" value="1"/>
												  
												  &nbsp; x &nbsp;<i class="fa fa-rupee"></i> &nbsp; 
												  <?php if ($option_value['price']) { ?>
												  <input type="hidden" name="option_price[<?php echo $option['product_option_id']; ?>][]" class="option-price" value="<?php echo $option_value['price'];?>"/>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												  </span>
												</div>
											</li>
											<?php } ?>
										  </div>
										</div>
									</ul>
						 <?php } } ?>
						 </div>
						 <?php } ?>
						
						 </div>
						<!-- end of nonveg menu-->
          
						 
                         <div class="clearfix"></div>    
                        </div>
						
						<div class="form-group">
							<!--<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
							<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />-->
							<input type="hidden" name="product_id" value="<?php echo $productIds; ?>" />
							<input type="hidden" name="option_id" value="" />
							<br />
							<button type="button" id="cartNew" data-loading-text="<?php echo $text_loading; ?>" class="ghost-on-hover-btn">save</button>	<br />	<br />


			           </div>

						
                           
						<div id="myselection">	
							<div id="right">
								<a class="handle ui-slideouttab-handle-rounded">Your Selection<i class="fa fa-icon fa-filter"></i></a>
								<div id="selectedContentDiv" style="height:212px;width:212px;"></div>
							</div>
						</div>
						<?php //print_r($this->session->data['optioncart']);?>
                        
                    </div>
                    
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
						<div class="rc-sidebar">
							<div class="sidebar-search-area margin-bottom-sidebar">
								<div id="rightside"></div>
							</div>
						</div>
					</div>
                </div>
            </div>
            <!-- Single Menu Area End Here -->			

<script type="text/javascript">
	
	$('#right').tabSlideOut({
      tabLocation: 'right',
      offsetReverse: true,
      handleOffsetReverse: true
    });
	
	$('#nonvegmenu').hide();
	$("#nonvegButton").css("background-color","#fff");
	$("#vegButton").css("background-color","#e8e8e8");
	$('#nonvegmenudata').hide();
	
	
	if ($(".activetab")[0]){
		//alert('i am here');
		$(".veg").addClass('inactivetab');
		$(".nonveg").addClass('inactivetab');
		$(".activetab").removeClass('inactivetab');
		$(".activetab").show();
		
		$(".inactivetab").hide();
		// Do something if class exists
	} else {
		// Do something if class does not exist
		alert('i am not here')
	}
	
	$('#nonvegmenuid,#nonvegButton').on("click",function() {	
			$('#vegmenudata').hide();
			$(".vegitem").hide();
			$('#nonvegmenudata').show();  
			$("#nonvegButton").css("background-color","#e8e8e8");
			$("#vegButton").css("background-color","#fff"); 
	});
	
	
	
	$('#vegmenuid,#vegButton').on("click",function() {
			$(".vegitem").show();		
			$('#nonvegmenu').hide();
			$('#nonvegmenudata').hide();
			$('#vegmenu').show();
			$('#vegmenudata').show();
			$("#vegButton").css("background-color","#e8e8e8");
			$("#nonvegButton").css("background-color","#fff");
		
	});
	
	$(document).ready(function(){
		
		var selected = [];
		//$('input:checked').each(function() {
			$('input:checkbox').on("click",function(){
				//if($(this).is(':checked')){
					//alert($(this).val());
					//var str = $(this).is(':checked');
					//$("#option_id").val()
									
				//}
			});
			//selected.push($(this).attr('name'));
			
		//});
		
		$("#cartNew").on("click",function(){
			$.ajax({
				url:"index.php?route=product/options/getSelectedOptionsData",
				//url:"index.php?route=product/options/getSelectedOptionsData",
				//data:"&options=61,62",
				data : $("#product").serialize(),
				type:"post",
				success:function(response){
					var str = '';

					$("#successmsg").hide();
					if(response){
						var msg = 'Data are stored successfully in "Your selection cart"';
						
						var data = JSON.parse(response);
						//alert(data[0].name);
						str += "<table>";
						str += "<tr><th width='60%'>Option Name</th><th width='20%'>Qty</th><th width='20%'>Price</th><th width='20%'>Delete</th></tr>";
						for(var i=0;i<data[0].length;i++){
							
							str += "<tr><td width='60%'>"+data[0][i].name+"</td><td width='20%'>"+data[0][i].qty+"</td><td width='20%'>"+data[0][i].price+"</td><td><a href='index.php?route=product/options&menuType=food'><input type='button' value='X' class='btn btn-info'></button> </a></td></tr>";
							
						}
						str += "<tr><td width='60%'></td><td width='20%'><span style='font-weight:bold;'>Sub-Total</span></td><td width='20%'>&nbsp;&nbsp;"+data[1]+"</td></tr>";
						
						str += "<tr><td width='60%'></td><td width='20%'><span style='font-weight:bold;'>Total</span></td><td width='20%'>&nbsp;&nbsp;"+data[1]+"</td></tr>";
						str += "</table>";

                        str +="<input type='hidden' name='product_id' value='<?php echo $product_id; ?>' />";
						str += "<input type='button' id='next' name='next' value='ADD TO CART' style='margin-left:5px' class='ghost-on-hover-btn'/></a>";

                        /*str += "<a href='index.php?route=product/product/route=product/displayOptionsPage&path=95&product_id=51'><input type='button' id='next' name='next' value='ADD TO CART' style='margin-left:5px' class='ghost-on-hover-btn'/></a>";*/
                       /* str += "<input type='button' id='button-cart' value='ADD TO CART' name='button-cart' style='margin-left:5px' class='ghost-on-hover-btn' />";
                       */
						 function clicked() {
                        alert('clicked');
                         } 

						$("#successmsg").html(msg); 
						$("#successmsg").show();
						
						setTimeout(function(){
							$("#successmsg").html('');
							$("#successmsg").hide();
						},3000);
						
					} else {
						str = 'No Data Selected';
					}
					
					$("#selectedContentDiv").html(str);
					$("#rightside").html(str);
				}
			});
		});
		
		});

</script>
						
                

                       



						
                       
                       

                       



</script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	//alert();
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#reviewForm').after('<div class=" clearfix m-b-10"></div><div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#reviewForm').after('<div class=" clearfix m-b-10"></div><div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

jQuery(document).ready(function($) {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>


<script type="text/javascript">
$(".fa-star").on("click",function(){
	$(this).css()
});

$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
</script>
</script>

<?php echo $footer; ?>
