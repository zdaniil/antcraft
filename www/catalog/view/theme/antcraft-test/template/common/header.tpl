<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <?php echo $title; ?>
    </title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    
    <!-- ---------------------FONTS--------------------- -->

    <script src="https://use.fontawesome.com/19272a5346.js" async></script>

    <!-- ---------------------Bootstrap--------------------- -->

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <!-- ----------------BX SLIDER----------------- -->

    <script src="catalog/view/theme/antcraft-test/scripts/jquery.bxslider/jquery.bxslider.min.js" async></script>
    <link href="catalog/view/theme/antcraft-test/scripts/jquery.bxslider/jquery.bxslider.css" rel="stylesheet"/>

    <!-- ---------------------SLIDEBARS----------------------- -->

    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/scripts/Slidebars-master/dist/slidebars.css">
    <script src="catalog/view/theme/antcraft-test/scripts/Slidebars-master/dist/slidebars.js" async></script>


    <!-- --------------jQuery FatNav & STYLES------------- -->
    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/plugins/fatNav/jquery.fatNav.min.css">
    <script type="text/javascript" src="catalog/view/theme/antcraft-test/plugins/fatNav/jquery.fatNav.min.js"></script>

    <!-- --------------PROJECT SCRITPS & STYLES------------- -->
    <script src="catalog/view/theme/antcraft-test/scripts/main.js" async></script>
    <script src="catalog/view/theme/antcraft-test/scripts/index.js" async></script>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <!-- <script src="catalog/view/javascript/jquery-ui.slider.min.js" async></script> -->

    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/fonts/lato/lato.css">
    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/styles/bxslider-styles.css">
    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/styles/index.css">
    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/styles/modal-windows.css">
    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/styles/animate.css">
    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/styles/global.css">
    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/styles/popularSection.css">

    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/stylesheet/jquery-ui.slider.min.css">
    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/styles/product.css">
    <link rel="stylesheet" href="catalog/view/theme/antcraft-test/styles/catalog.css">


    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php echo $google_analytics; ?>

</head>

<body>
<div class="container cont">
    <div class="row">
        <div class="dark-body"></div>

        <div class="container">
            <header class="row main-header">
                <div class="contacts">
                    <div class="phone-number"><a href="tel:+380937630450"><br>+380937630450</a> <br><span>Пн-Пт 09:00-19:00</span>
                        <br><span>Сб 11:00-17:00</span>
                    </div>
                    <a class="header-socials" href="https://www.facebook.com/antcraft.com.ua" target="_blank">
                        <div class="facebook-logo"></div>
                    </a>
                    <a class="header-socials" href="https://vk.com/antCraft3" target="_blank">
                        <div class="vk-logo"></div>
                    </a>
                    <a class="header-socials" href="https://www.instagram.com/antcraft.com.ua/" target="_blank">
                        <div class="instagram-logo"></div>
                    </a>
                </div>
                <h1 class="main-title"><a href="https://antcraft.com.ua/">Antcraft</a></h1>
                <ul class="header-nav">
                    <li>
                        <?php echo $search; ?>
                    </li>
                    <li class="enter-btn">
                        <a href="https://antcraft.com.ua/index.php?route=account/account">
                            <div class="enter-logo"></div>
                            <br><span class="some-margin">Войти</span></a>
                    </li>
                    <li class="basket-btn">
                        <a class="basket-on">
                            <div class="basket-logo"></div>
                            <br><span class="some-margin">Корзина</span></a>
                        <?php echo $cart; ?>
                    </li>
                </ul>
            </header>
        </div>


        <div class="container main-navigation">
            <div class="container">
                <div class="main-nav-wrapper">
                    <nav>
                        <?php foreach ($categories as $k=>$category) { ?>
                        <div class="nav-item" id="<?php echo 'item-'.$k; ?>">
                            <a href="<?php echo $category['href']; ?>">
                                <?php echo $category['name']; ?>
                            </a>
                        </div>
                        <?php } ?>
                        <div class="other-nav-item"><a href="">Блог</a></div>


                        <ul class=" nav navbar-nav navbar-right act-menu">
                            <li class="some-top-margin">
                                <a href="#">
                                    <div class="header-search-logo"></div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="header-enter-logo"></div>
                                </a>
                            </li>
                            <li>
                                <a style="cursor: pointer" class="basket-on">
                                    <div class="header-basket-logo"></div>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div id="fallout-nav">
            <div class="fallout-nav-wrapper">

                <?php foreach ($categories as $k=>$category) { ?>


                <?php if($category['children']) { ?>

                <?php foreach($category['children'] as $children) { ?>

                <li class="sub-item-<?php echo $k; ?> sub-item"><a href="<?php echo $children['href']; ?>">
                        <img src="
                       <?php if($category['name']=='Ножи')echo 'https://antcraft.com.ua/catalog/view/theme/antcraft-test/imgs/block4/knife1.png';
                       else if ($category['name']=='Фонари') echo 'https://antcraft.com.ua/catalog/view/theme/antcraft-test/imgs/armytek.jpg';
                       else if ($category['name']=='Часы') echo 'https://antcraft.com.ua/catalog/view/theme/antcraft-test/imgs/clock.jpg';
                       else if ($category['name']=='Ручки') echo 'https://antcraft.com.ua/catalog/view/theme/antcraft-test/imgs/pen.jpg';
                       else if ($category['name']=='Блокноты') echo 'https://antcraft.com.ua/catalog/view/theme/antcraft-test/imgs/note.jpeg';
                       else if ($category['name']=='Органайзеры') echo 'https://antcraft.com.ua/catalog/view/theme/antcraft-test/imgs/bag.jpg';
                       else echo 'https://antcraft.com.ua/catalog/view/theme/antcraft-test/imgs/port.jpg';

                       ?>
                       " alt="" height="150" width="150">
                        <div><?php echo $children['name'] ?>
                        </div>


                    </a></li>

                <?php } ?>
                <?php } ?>


                <?php } ?>

            </div>
        </div>

        <div class="fat-nav">
            <div class="fat-nav__wrapper">
                <ul>
                    <?php foreach ($categories as $category) { ?>

                    <li><a href="<?php echo $category['href']; ?>">
                            <?php echo $category['name']; ?>
                        </a></li>
                    <?php } ?>
                    <li><a href="#">Блог</a></li>
                    <li><a href="https://antcraft.com.ua/index.php?route=checkout/cart">Корзина</a></li>
                    <li><span style="text-align: center;">
                        
+380937630450<br>
Пн-Пт 09:00-19:00<br>
Сб 11:00-17:00<br>
                    </span></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>