<?php echo $header; 
$categoryName = '';
//echo 'ia m here';//die;
?>

<!-- Single Menu Area Start Here -->

            <div class="single-menu-area">
                <div class="container">
				
		        <ul class="breadcrumb">
             <?php foreach ($breadcrumbs as $breadcrumb) { 
			if($breadcrumb['text'] == 'Venue'){
				$categoryName = 'Venue';
			}
			if($breadcrumb['text'] == 'Caterer'){
				$categoryName = 'Caterer';
			}
	?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  
    
            <!-- Single Menu Area End Here -->
                     
						
						<?php 
							$mainCourseOptions = array();
							$welcomeDrinkOptions = array();
							$startersOptions = array();
							$dessertsOptions = array();
							$i=0;
							foreach ($options as $option) { 						 
								$dd = explode("#",$option['name']);
								
								if (strpos($option['name'], 'Welcome Drink') !== false) { 
									$welcomeDrinkOptions[] = $options[$i];				
								}
								
								if (strpos($option['name'], 'Starters') !== false) { 
									$startersOptions[] = $options[$i];
								}
								
								if (strpos($option['name'], 'Main Course' ) !== false) {
									$mainCourseOptions[] = $options[$i];
								} 								
								
								if (strpos($option['name'], 'Desserts') !== false) { 
									$dessertsOptions[] = $options[$i];
								}
								
								$i++;
							} 
							
						?>
						
						
						<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12"> <!-- start of right hand side options -->
							<div class="rv-sidebar" id="product"> <!-- start of rc-sidebar -->
								<div style="">								
								
									<!-- start of Welcome Drink -->
									<?php if ($welcomeDrinkOptions) { ?>
									<button class="accordion">Welcome Drink</button>
									<div class="panel" style="min-height:auto !important;">
									
								<?php foreach ($welcomeDrinkOptions as $option) { ?>
								<div class="filters-area">                             																   
								    <?php if ($option['type'] == 'select') { ?>
										<ul>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
												<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
												<?php 
													$dd = explode("#",$option['name']);
													echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1].'</h2>'; 
												?>
												</label>
												<li>
													<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
														<option value=""><?php echo $text_select; ?></option>
														<?php foreach ($option['product_option_value'] as $option_value) { ?>
															<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
															<?php if ($option_value['price']) { ?>
																(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
															<?php } ?>
															</option>
														<?php } ?>
													</select>
												</li>
											</div>
										</ul>
									<?php } ?>
									
									<?php if ($option['type'] == 'radio') { ?>
										<ul>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											  <label class="control-label">
											  <?php 
												$dd = explode("#",$option['name']);
												echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1].'</h2>'; 
											  ?>
											  </label>
											  <div id="input-option<?php echo $option['product_option_id']; ?>">
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
												<li>
													<div class="radio">
													  <label>
														<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
														<?php if ($option_value['image']) { ?>
														<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
														<?php } ?>                    
														<?php echo $option_value['name']; ?>
														<?php if ($option_value['price']) { ?>
														(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
														<?php } ?>
													  </label>
													</div>
												</li>
												<?php } ?>
											  </div>
											</div>
										</ul>
									<?php } ?>
			
									<?php if ($option['type'] == 'checkbox') { ?>
									<ul>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
										  <label class="control-label">
										  <?php 
											$dd = explode("#",$option['name']);
											echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1].'</h2>'; 
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
													<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												  </label>
												</div>
											</li>
											<?php } ?>
										  </div>
										</div>
									</ul>
									<?php } ?>
									
			
									<?php if ($option['type'] == 'text') { ?>
										<ul>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
												<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
												<?php 
													$dd = explode("#",$option['name']);
													echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1].'</h2>'; 
												?>
												</label>
												<li>
													<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
												</li>
											</div>
										</ul>
									<?php } ?>
									
									
									<?php if ($option['type'] == 'textarea') { ?>
										<ul>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
												<?php 
													$dd = explode("#",$option['name']);
													echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1].'</h2>'; 
												?>
											  </label>
											  <li>
												<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
											  </li>
											</div>
										</ul>
									<?php } ?>
			
									<?php if ($option['type'] == 'file') { ?>
										<ul>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
												<label class="control-label">
												<?php 
													$dd = explode("#",$option['name']);
													echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1].'</h2>'; 
												?>
												</label>
												<li>
													<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block">
													<i class="fa fa-upload"></i> <?php echo $button_upload; ?>
													</button>
												</li>
												<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
											</div>
										</ul>
									<?php } ?>
			
									<?php if ($option['type'] == 'date') { ?>
										<ul>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
												<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
													<?php 
														$dd = explode("#",$option['name']);
														echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1].'</h2>'; 
													?>
												</label>
												<li>
													<div class="input-group date">
														<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
														<span class="input-group-btn">
														<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
														</span>
													</div>
												</li>
											</div>
										</ul>
									<?php } ?>
			
									<?php if ($option['type'] == 'datetime') { ?>
										<ul>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
												<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
												<?php 
													$dd = explode("#",$option['name']);
													echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1].'</h2>'; 
												?>
												</label>
												<li>
													<div class="input-group datetime">
														<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
														<span class="input-group-btn">
														<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
														</span>
													</div>
												</li>
											</div>
										</ul>
									<?php } ?>
			
									<?php if ($option['type'] == 'time') { ?>
										<ul>
											<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
												<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
												<?php 
													$dd = explode("#",$option['name']);
													echo '<h2 class="title-sidebar title-bar-sidebar">'.$dd[1].'</h2>'; 
												?>
												</label>
												<li>
													<div class="input-group time">
														<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
														<span class="input-group-btn">
														<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
														</span>
													</div>
												</li>
											</div>
										</ul>
									<?php } ?>
			
			
								   
									
								</div>
								<?php } ?>
                                
									</div>
									<?php } ?>
								
								
								
								<!-- start code for quanty and add to cart -->
								
				
								<div class="form-group">
								
								
								<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
								<br />
								<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="ghost-on-hover-btn">Confirm Card</button>
								
								</div>
								<!-- end code for quanty and add to cart -->								
								
							</div> <!-- end of rc-sidebar -->
						</div> <!-- end of right hand side options -->
						
                    </div>
                </div>
            </div>

								
								
								
            <!-- Single Menu Area End Here -->
			


	
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


<?php echo $footer; ?>
