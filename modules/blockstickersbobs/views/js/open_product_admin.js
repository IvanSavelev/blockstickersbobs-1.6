/**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 *  @author    PrestaShop SA <contact@prestashop.com>
 *  @copyright 2007-2017 PrestaShop SA
 *  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 *
 * Don't forget to prefix your containers with your own identifier
 * to avoid any conflicts with others containers.
 */
$(document).ready(function () {

    arrayStickers.forEach(function(Sticker) {
        if(Sticker['sticker_product_on']==1)
        {
            loadSticker(Sticker);
        }

    });

    $('[name = checkbox_sticker\\[\\]]').change(function () {
        if ($(this).attr('checked'))
        {
            var number_sticker=$(this).val();
            var number_array_sticker;
            arrayStickers.forEach(function(Sticker, key) {
                if(Sticker['id_sticker']==number_sticker) {
                    number_array_sticker=key;
                }
            });
            var Sticker=arrayStickers[number_array_sticker];
            loadSticker(Sticker);
        }
        else {
            var thisDIV = '#dinamic_stickers_' + $(this).val();
            $(thisDIV).remove();
        }
    });

    function loadSticker(Sticker) {
        var idDIV = 'dinamic_stickers_' + Sticker['id_sticker'];
        var DIV = $('#box_sticker_default_' + Sticker['type_sticker']);
        var DIVclone = DIV.clone();
        DIVclone.removeClass('hidden').removeAttr("id").attr('id', idDIV).appendTo("#block_type_view_senior").css('z-index',Sticker['id_sticker']);

        if (Sticker['type_sticker'] == 0) {
            $('#' + idDIV + ' > .sub_div').addClass(Sticker['class_color_corners']);

            DIVclone.css({
                'top': Sticker['y_sticker'] + 'px',
                'right': Sticker['x_sticker'] + 'px',
                'width': Sticker['width_sticker'] + 'px',
                'height': Sticker['height_sticker'] + 'px'
            });
        }

        if (Sticker['type_sticker'] == 1) {
            $('#' + idDIV + ' > .sub_div').addClass(Sticker['class_color_corners']);
            DIVclone.css({
                'top': Sticker['y_sticker'] + 'px',
                'left': Sticker['x_sticker'] + 'px',
                'width': Sticker['width_sticker'] + 'px',
                'height': Sticker['height_sticker'] + 'px'
            });
        }

        if (Sticker['type_sticker'] == 2) {
            $('#' + idDIV + ' > .sub_div').css({
                'line-height': (Sticker['height_sticker'] -  Sticker['size_font_sticker']) + 'px'
            });
            DIVclone.css({
                'top': Sticker['y_sticker'] + 'px',
                'left': Sticker['x_sticker'] + 'px',
                'width': Sticker['width_sticker'] + 'px',
                'height': Sticker['height_sticker'] + 'px'
            });
        }

        if (Sticker['type_sticker'] == 3) {
            $('#' + idDIV + ' > .sub_div').css({
                'line-height': Sticker['height_sticker']  + 'px'
            });
            DIVclone.css({
                'top': Sticker['y_sticker'] + 'px',
                'left': Sticker['x_sticker'] + 'px',
                'width': Sticker['width_sticker'] + 'px',
                'height': Sticker['height_sticker'] + 'px'
            });
        }

        if (Sticker['type_sticker'] != 4) //HTML sticker
        {
            $('#' + idDIV + ' > .sub_div').css({
                'color': Sticker['color_font_sticker'],
                'font-size': Sticker['size_font_sticker'] + 'px',
                'background': Sticker['color_background_sticker']
            });
            $('#' + idDIV + ' > .sub_div').text(Sticker['text_sticker']);
        }

        if(Sticker['type_sticker'] == 4) { //IMAGE Sticker
            DIVclone.css({
                'top': Sticker['y_sticker'] + 'px',
                'left': Sticker['x_sticker'] + 'px',
                'width': Sticker['width_sticker'] + 'px',
                'height': Sticker['height_sticker'] + 'px'
            });
            $('#' + idDIV + ' > .sub_div').width(Sticker['width_sticker'] + 'px');
            $('#' + idDIV + ' > .sub_div').height(Sticker['height_sticker'] + 'px')
            $('#' + idDIV + ' > .sub_div').attr('src', Sticker['current_url_img']);
        }


    }


});

