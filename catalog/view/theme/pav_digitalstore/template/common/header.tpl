<?php 
/******************************************************
 * @package Pav Opencart Theme Framework for Opencart 1.5.x
 * @version 1.1
 * @author http://www.pavothemes.com
 * @copyright Copyright (C) Augus 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license   GNU General Public License version 2
*******************************************************/
$themeName =  $sconfig->get('theme_default_directory');
$themeConfig = array( array('header' => ''), $sconfig->get('themecontrol') );

/* Add scripts files */
$helper->addScript( 'catalog/view/javascript/jquery/jquery-2.1.1.min.js' );
$helper->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
$helper->addScript( 'catalog/view/javascript/bootstrap/js/bootstrap.min.js' );
$helper->addScript( 'catalog/view/javascript/common.js' );
$helper->addScript( 'catalog/view/theme/'.$themeName.'/javascript/common.js' );

$theme_width = $helper->getConfig('theme_width');
if( isset($themeConfig['catalog_mode']) && $themeConfig['catalog_mode'] ){
  $cart = null;   
} 
$logoType = $helper->getConfig('logo_type','logo-theme');
$headerlayout = $helper->getConfig('header_layout');
$template_layout = $helper->getConfig('layout');
$skin = $helper->getConfig('skin');


if( $helper->getConfig('enable_paneltool') ){
  if( $helper->getParam('headerlayout') ){
    $headerlayout = $helper->getParam('headerlayout');
  }

  if($helper->getParam('layout')){
    $template_layout = $helper->getParam('layout');
  }


 
  $helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/paneltool.css' );
  $helper->addScript( 'catalog/view/javascript/jquery/colorpicker/js/colorpicker.js' );
  $helper->addCss( 'catalog/view/javascript/jquery/colorpicker/css/colorpicker.css' );
}

$helper->addScriptList( $scripts );

$ctheme=$helper->getConfig('customize_theme');
if( file_exists(DIR_TEMPLATE.$themeName.'/stylesheet/customize/'.$ctheme.'.css') ) {  
  $helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/customize/'.$ctheme.'.css'  );
}

if($direction == "rtl"){
   $helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/rtl/stylesheet-rtl.css'  );
}

$helper->addCss( 'catalog/view/javascript/font-awesome/css/font-awesome.min.css' ); 
$helper->addCss('catalog/view/javascript/jquery/magnific/magnific-popup.css');
// -$helper->addCss( '//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700' ); 
 
$helper->addCssList( $styles ); 
$logoType = $helper->getConfig('logo_type','logo-theme');

?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" class="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content= "<?php echo $keywords; ?>" />
    <?php } ?>

    <?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($helper->getCssLinks() as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach( $helper->getScriptFiles() as $script )  { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>


    <?php if( isset( $theme_width )) { ?>
    <style> #page .container{max-width:<?php echo $theme_width;?>;} </style>
    <?php } ?>
<!-- FONT -->
<?php 
  if( isset($themeConfig['enable_customfont']) && $themeConfig['enable_customfont'] ){
  $css=array();
  $link = array();
  for( $i=1; $i<=3; $i++ ){
    if( trim($themeConfig['google_url'.$i]) && $themeConfig['type_fonts'.$i] == 'google' ){
      $link[] = '<link rel="stylesheet" type="text/css" href="'.trim($themeConfig['google_url'.$i]) .'"/>';
      $themeConfig['normal_fonts'.$i] = $themeConfig['google_family'.$i];
    }
  }
  echo implode( "\r\n",$link );
?>
<style>
  body {font-family: <?php echo $themeConfig['normal_fonts1']; ?>; font-size: <?php echo $themeConfig['fontsize1']; ?>}
  #header-main {font-family: <?php echo $themeConfig['normal_fonts2']; ?>; font-size: <?php echo $themeConfig['fontsize2']; ?>}
  #module-container {font-family: <?php echo $themeConfig['normal_fonts3']; ?>; font-size: <?php echo $themeConfig['fontsize3']; ?>}

  <?php 
    if( trim($themeConfig['body_selector4']) && trim($themeConfig['normal_fonts4']) ){
      $css[]= trim($themeConfig['body_selector4'])." {font-family:".str_replace("'",'"',htmlspecialchars_decode(trim($themeConfig['normal_fonts4'])))."}\r\n" ;
    }
     echo implode("\r\n",$css);
  ?>
</style>
<?php } ?>
<!-- FONT -->
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<!-- MailChimp: Connect Your Site -->
<script id="mcjs">!function(c,h,i,m,p){m=c.createElement(h),p=c.getElementsByTagName(h)[0],m.async=1,m.src=i,p.parentNode.insertBefore(m,p)}(document,"script","https://chimpstatic.com/mcjs-connected/js/users/7179e0fbe457bf650bded2764/86a78d9dea9b93f0f28b21c2b.js");</script>
<!-- /MailChimp: Connect Your Site -->

</head>
<body class="<?php echo $class; ?> <?php echo $helper->getPageClass();?> layout-<?php echo $template_layout; ?>">


  <div  class="row-offcanvas row-offcanvas-left">

  <div id="page">


<!-- header -->
<?php 
  if( file_exists($helper->getLayoutPath('common/header/'.$headerlayout.'.tpl')) ) {
    require( $helper->getLayoutPath('common/header/'.$headerlayout.'.tpl') );
  }else {
    require( ThemeControlHelper::getLayoutPath( 'common/header/default.tpl' ) );  
  } 
?> 
<!-- /header -->



<!-- sys-notification -->
<div id="sys-notification">
  <div class="container">
    <div id="notification"></div>
  </div>
</div>
<!-- /sys-notification -->

<?php
/**
 * Showcase modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 */
$blockid = 'slideshow';
$blockcls = '';
$ospans = array(1=>9, 2=>3);
require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
?>

<?php
/**
 * Showcase modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 */
$blockid = 'showcase';
$blockcls = '';
$ospans = array();
require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
?>


<?php
/**
 * promotion modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 */
$blockid = 'promotion';
$blockcls = '';
$ospans = array();
require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
?>
