<?php echo $header; ?>
<div class="row product-wrapper">
    <div class="container">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
        <div class="col-md-6 product-left">
            <?php if ($thumb || $images) { ?>
            <ul class="modal-left-side">
                <?php if ($thumb) { ?>
                <li><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                         alt="<?php echo $heading_title; ?>"></li>

                <?php } ?>
                <?php if ($images) { ?>
                <?php foreach ($images as $image) { ?>

                <li><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
                         alt="<?php echo $heading_title; ?>"/></li>
                <?php } ?>
                <?php } ?>
            </ul>
            <?php } ?>
        </div>
        <div class="col-md-6 product-right">
            <h3><?php echo $heading_title; ?></h3>


           <!-- <span class="product-description"><?php echo $short_description; ?></span>-->
            <?php if ($price) { ?>

            <?php if (!$special) { ?>
            <span class="modal-price"><span class="bigger-prise"><?php echo $price; ?></span></span>
            <?php } else { ?>
            <span class="modal-price"><span class="bigger-prise"><?php echo $special; ?></span></span>
            <?php } ?>
            <?php if ($points) { ?>
            <span class="modal-price-bonus"><span class="bigger-bonus"><?php echo $points; ?> </span> бонус <a href="#"><div
                            class="question"></div></a></span>

            <?php } ?>

            <?php } ?>

            <hr>
            <div class="color-block">
                <span class="color-option">Цвет: </span>
                <select class="color">
                    <option>металлик</option>
                    <option>черный</option>
                    <option>красный</option>
                </select>
                <a href="#"><span class="color-rectangle color1"></span></a>
                <a href="#"><span class="color-rectangle color2"></span></a>
                <a href="#"><span class="color-rectangle color3"></span></a>
                <a href="#"><span class="color-rectangle color4"></span></a>
                <a href="#"><span class="color-rectangle color5"></span></a>
                <a href="#"><span class="color-rectangle color6"></span></a>
            </div>
            <div class="modal-vendor-code">Артикул: <?php $sku?></div>
            <div class="modal-quantity">Количество</div>

            <select class="modal-quantity-select" id="antcraftquantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select>
            <script type="text/javascript">
                $("#antcraftquantity").change(function (e) {
                    var value = $("#antcraftquantity").val();
                    $("input[name='quantity']").val(value)
                });

            </script>
            <a id="button-cart">
                <div class="in-basket-bnt">
                    <div class="in-basket-btn-logo"></div>
                    добавить в корзину
                </div>
            </a>

            <div>
                <ul class="nav nav-tabs product-menu" role="tablist">
                    <li role="presentation" class="active "><a href="#home" aria-controls="home" role="tab"
                                                               data-toggle="tab">описание</a></li>
                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">характеристики</a>
                    </li>
                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">обзор
                            и видео</a></li>
                    <?php if ($review_status) { ?>
                    <!--<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">-->
                    <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></span> </a></li>
                    <?php } ?>

                </ul>


                <div class="tab-content">
                    <div role="tabpanel" class=" tab-pane fade in active description-text " id="home">
                        <span><?php echo $description; ?></span>
                    </div>
                    <div role="tabpanel" class="tab-pane fade characteristics-text" id="profile">
                        <ul>
                            <table class="table table-bordered">
                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                <thead>
                                <tr>
                                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <tr>
                                    <td><?php echo $attribute['name']; ?></td>
                                    <td><?php echo $attribute['text']; ?></td>
                                </tr>
                                <?php } ?>
                                </tbody>
                                <?php } ?>
                            </table>
                        </ul>
                        <a href="<?php echo $manufacturer['href']?>">
                            <img src="<?php echo HTTPS_SERVER.'image/'.$manufacturer['image']?>" width="145" alt="">
                            <span>Все товары <?php echo $manufacturer['name'] ?></span>
                        </a>
                    </div>
                    <div role="tabpanel" class="tab-pane fade review-video-text description-text " id="messages">
                        <?php echo isset($video_description) ? $video_description :  '' ?>
                    </div>
                    <?php if ($review_status) { ?>
                    <div class="tab-pane" id="tab-review">
                        <form class="form-horizontal">
                            <div id="review"></div>
                            <h2><?php echo $text_write; ?></h2>
                            <?php if ($review_guest) { ?>
                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                    <input type="text" name="name" value="" id="input-name" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                    <div class="help-block"><?php echo $text_note; ?></div>
                                </div>
                            </div>
                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <label class="control-label"><?php echo $entry_rating; ?></label>
                                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                    <input type="radio" name="rating" value="1"/>
                                    &nbsp;
                                    <input type="radio" name="rating" value="2"/>
                                    &nbsp;
                                    <input type="radio" name="rating" value="3"/>
                                    &nbsp;
                                    <input type="radio" name="rating" value="4"/>
                                    &nbsp;
                                    <input type="radio" name="rating" value="5"/>
                                    &nbsp;<?php echo $entry_good; ?></div>
                            </div>
                            <?php if ($site_key) { ?>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                                </div>
                            </div>
                            <?php } ?>
                            <div class="buttons clearfix">
                                <div class="pull-right">
                                    <button type="button" id="button-review"
                                            data-loading-text="<?php echo $text_loading; ?>"
                                            class="btn btn-primary"><?php echo $button_continue; ?></button>
                                </div>
                            </div>
                            <?php } else { ?>
                            <?php echo $text_login; ?>
                            <?php } ?>
                        </form>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>

    <?php echo $content_bottom; ?>

    <div id="product" style="display: none;">
        <?php if ($options) { ?>
        <hr>
        <h3><?php echo $text_option; ?></h3>
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"
                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <select name="option[<?php echo $option['product_option_id']; ?>]"
                    id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                </option>
                <?php } ?>
            </select>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                    <label>
                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                        <?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                        <?php } ?>
                    </label>
                </div>
                <?php } ?>
            </div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]"
                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                        <?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                        <?php } ?>
                    </label>
                </div>
                <?php } ?>
            </div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                    <label>
                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                        <img src="<?php echo $option_value['image']; ?>"
                             alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                             class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                        <?php } ?>
                    </label>
                </div>
                <?php } ?>
            </div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"
                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                   value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"
                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5"
                      placeholder="<?php echo $option['name']; ?>"
                      id="input-option<?php echo $option['product_option_id']; ?>"
                      class="form-control"><?php echo $option['value']; ?></textarea>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
                    data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i
                        class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""
                   id="input-option<?php echo $option['product_option_id']; ?>"/>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"
                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                       value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD"
                       id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"
                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                       value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm"
                       id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"
                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                       value="<?php echo $option['value']; ?>" data-date-format="HH:mm"
                       id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
        </div>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php if ($recurrings) { ?>
        <hr>
        <h3><?php echo $text_payment_recurring ?></h3>
        -->
        <div class="form-group required" style="display: none">
            <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
            </select>
            <div class="help-block" id="recurring-description"></div>
        </div>
        <?php } ?>
        <div class="form-group" style="display: none">
            <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
            <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity"
                   class="form-control"/>
            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
            <br/>
            <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"
                    class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
        </div>
 
    </div>
</div>


<script type="text/javascript">
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });

    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').button('loading');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
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

                    $('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    });

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

    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
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
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });


    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : ''),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
    });

    $(document).ready(function () {
        $('.thumbnails').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });
    });
</script>
<?php echo $footer; ?>