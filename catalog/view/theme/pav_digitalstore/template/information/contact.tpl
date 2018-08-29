<?php
    $config = $sconfig;
    $theme  = $themename;
    $themeConfig = (array)$config->get('themecontrol');
?>
<?php echo $header; ?>
<div class="container">
    <?php require( PAVO_THEME_DIR."/template/common/config_layout.tpl" );  ?>
  <?php require( PAVO_THEME_DIR."/template/common/breadcrumb.tpl" );  ?>
  <div class="row"><?php if( $SPAN[0] ): ?>
			<aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>">
				<?php echo $column_left; ?>
			</aside>	
		<?php endif; ?> 
  
   <section id="sidebar-main" class="col-md-<?php echo $SPAN[1];?>"><div id="content"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <h3><?php echo $text_location; ?></h3>

      <div class="contact-location hidden-xs">
        <div id="contact-map">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d903.6606591887645!2d121.50933782920696!3d25.0461989989979!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a90c4758f579%3A0xb9a3ed88b4473747!2zTm8uIDI1LTEsIFNlY3Rpb24gMSwgWmhvbmdodWEgUm9hZCwgWmhvbmd6aGVuZyBEaXN0cmljdCwgVGFpcGVpIENpdHksINCi0LDQudCy0LDQvdGMIDEwMA!5e0!3m2!1sru!2sth!4v1535517363144" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>
      </div>
          <div class="row contact-content">
            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 hidden-xs">
             <div class="contact-info">
                <h3><?php echo $heading_title; ?></h3>
               <!-- <div class="contact-address contact-address-custom">
                    <p><?php echo $store; ?></p>
                <ul><li><i class="fa fa-map-marker"></i><span><b><?php echo $text_address; ?></b><br />
                    <?php echo $address; ?></span></li>
                    <?php if ($telephone) { ?>
                    <li><i class="fa fa-phone"></i><span><b><?php echo $text_telephone; ?></b><br />
                    <?php echo $telephone; ?></span></li>
                    <?php } ?>
                    <?php if ($fax) { ?>
                    <li><i class="fa fa-hdd-o"></i><span><b><?php echo $text_fax; ?></b><br />
                    <?php echo $fax; ?></span></li>
                    <?php } ?>
                </ul>
                  </div>-->
          </div>
          <?php 
              $html = html_entity_decode($themeConfig['contact_customhtml'][$config->get('config_language_id')]);
              $c = 0;
              $c2 = 8;
               if( $html ){

               }
            ?>
            <div class="contact-customhtml">
              <div class="content">
                <?php echo $html; ?>
              </div>
            </div>

           </div><!-- end1 -->
           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal ">              
              <fieldset class="">
                <h3><?php echo $text_contact; ?></h3>
                <div class="content">
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                    <?php if ($error_name) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                    <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                  <div class="col-sm-10">
                    <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                    <?php if ($error_enquiry) { ?>
                    <div class="text-danger"><?php echo $error_enquiry; ?></div>
                    <?php } ?>
                  </div>
                </div>
               <?php echo $captcha; ?>
                 <div class="buttons">
                  <div class="pull-right">
                    <input class="button" type="submit" value="<?php echo $button_submit; ?>" />
                  </div>
                </div>
              </div>
                
              </fieldset>   
       
      </form>
    </div>
      <!-- end --> 
          </div><!-- end -->
      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
   </section> 
<?php if( $SPAN[2] ): ?>
	<aside id="sidebar-right">	
		<?php echo $column_right; ?>
	</aside>
<?php endif; ?></div>
</div>

 <?php // Jquery googlemap api v3?>
<script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyBEyQxItIt2AFXqZvOEFWttGyyH3U4oJaU"></script>
<script type="text/javascript" src="catalog/view/javascript/gmap/gmap3.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/gmap/gmap3.infobox.js"></script>
    <script type="text/javascript">
        var mapDiv, map, infobox;
        var lat = <?php echo isset($themeConfig['location_latitude'])?$themeConfig['location_latitude']:'25.046266'; ?>;
        var lon = <?php echo isset($themeConfig['location_longitude'])?$themeConfig['location_longitude']:'121.509891'; ?>;
        jQuery(document).ready(function($) {
            mapDiv = $("#contact-map");
            mapDiv.height(400).gmap3({
                map:{
                    options:{
                        center:[lat,lon],
                        zoom: 15
                    }
                },
                marker:{
                    values:[
                        {latLng:[lat, lon], data:"<?php echo isset($themeConfig['location_address'])?$themeConfig['location_address']:'79-99 Beaver Street, New York, NY 10005, USA'; ?>"},
                    ],
                    options:{
                        draggable: false
                    },
                    events:{
                          mouseover: function(marker, event, context){
                            var map = $(this).gmap3("get"),
                                infowindow = $(this).gmap3({get:{name:"infowindow"}});
                            if (infowindow){
                                infowindow.open(map, marker);
                                infowindow.setContent(context.data);
                            } else {
                                $(this).gmap3({
                                infowindow:{
                                    anchor:marker, 
                                    options:{content: context.data}
                                }
                              });
                            }
                        },
                        mouseout: function(){
                            var infowindow = $(this).gmap3({get:{name:"infowindow"}});
                            if (infowindow){
                                infowindow.close();
                            }
                        }
                    }
                }
            });
        });
    </script>
    <?php //end contact map ?>
<?php echo $footer; ?>
