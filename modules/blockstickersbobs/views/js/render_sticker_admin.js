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

    $('[name = height_sticker]').change(function () {
        $('[name = height_sticker]').val(this.value);
    });


    var block_type_view_senior = $('#block_type_view_senior').offset();
    var left_drag = block_type_view_senior.left - $('#box_sticker').width();
    var top_drag = block_type_view_senior.top - $('#box_sticker').height();
    var right_drag = block_type_view_senior.left + Number(width_box);
    var bottom_drag = block_type_view_senior.top + Number(width_box);
    $("#box_sticker").draggable(
        {
            containment: [left_drag, top_drag, right_drag, bottom_drag],
            // containment: [0, 0, Number(width_box), Number(width_box)],
            drag: handleDrag
        }
    );
    if (type_sticker == 3) {
        $("#box_sticker").draggable('option', 'axis', 'y');
    }

    function updateStikcerView() {
        var block_type_view_senior = $('#block_type_view_senior').offset();
        var left_drag = parseInt(block_type_view_senior.left - $('#box_sticker').width());
        var top_drag = parseInt(block_type_view_senior.top - $('#box_sticker').height());
        var right_drag = parseInt(block_type_view_senior.left + Number(width_box));
        var bottom_drag = parseInt(block_type_view_senior.top + Number(width_box));
        $("#box_sticker").draggable('option', 'containment', [left_drag, top_drag, right_drag, bottom_drag]);
        $('#horizontal_strip_sticker').css({'line-height': $('#horizontal_strip_sticker').height() + 'px'});
        var line_height = parseInt($('[name = height_sticker]').val()) - parseInt($("[name = size_font_sticker]").val());
        //$('#label_sticker').css({'line-height': line_height + 'px'});
        $('#box_sticker').css({'line-height': $('[name = height_sticker]').val() + 'px'});
    }

    updateStikcerView();
    $(window).resize(function () {
        setTimeout(updateStikcerView, 700);
    });


    function handleDrag(event, ui) {

        $('[name = x_sticker]').val(Math.round(ui.position.left));
        $('[name = y_sticker]').val(Math.round(ui.position.top));
        if(type_sticker == 3)
        {
            $('[name = x_sticker]').val('0');
        }

    }



    //  $('#colorpickerHolder').ColorPicker({flat: true});
    $('.row_sticker').on('change', ":radio[name='type_sticker']", function () {
        if (this.value == 0) //Right
        {
            $('#box_sticker_angle_right').removeClass('hidden');
            $('#box_sticker_angle_left').addClass('hidden');
            $('#label_sticker').addClass('hidden');
            $('#horizontal_strip_sticker').addClass('hidden');
            $('#image_sticker').addClass('hidden');
            $('#label_stylized_sticker').addClass('hidden');


            $('#sticker_block_basis').fadeIn();
            $('#sticker_block_image').fadeOut();
            $('#sticker_block_WHTP').fadeOut();
            $('#sticker_block_horizontal_strip').fadeOut();


            $("#box_sticker_angle_right").css({'right': sticker_default_angle_right['x_sticker'] + 'px'});
            $("#box_sticker_angle_right").css({'top': sticker_default_angle_right['y_sticker'] + 'px'});
            $('#box_sticker_angle_right').css({'width': sticker_default_angle_right['width_sticker'] + 'px'});
            $('#box_sticker_angle_right').css({'height': sticker_default_angle_right['height_sticker'] + 'px'});

            $('#message_view_stickers').addClass('hidden');


            //for save
            $('[name = x_sticker]').val(sticker_default_angle_right['x_sticker']);
            $('[name = y_sticker]').val(sticker_default_angle_right['y_sticker']);
            $('[name = width_sticker]').val(sticker_default_angle_right['width_sticker']);
            $('[name = height_sticker]').val(sticker_default_angle_right['height_sticker']);


        }
        if (this.value == 1) //Left
        {
            $('#box_sticker_angle_right').addClass('hidden');
            $('#box_sticker_angle_left').removeClass('hidden');
            $('#label_sticker').addClass('hidden');
            $('#horizontal_strip_sticker').addClass('hidden');
            $('#image_sticker').addClass('hidden');
            $('#label_stylized_sticker').addClass('hidden');

            $('#sticker_block_basis').fadeIn();
            $('#sticker_block_image').fadeOut();
            $('#sticker_block_WHTP').fadeOut();
            $('#sticker_block_horizontal_strip').fadeOut();

            $("#box_sticker_angle_left").css({'left': sticker_default_angle_left['x_sticker'] + 'px'});
            $("#box_sticker_angle_left").css({'top': sticker_default_angle_left['y_sticker'] + 'px'});
            $('#box_sticker_angle_left').css({'width': sticker_default_angle_left['width_sticker'] + 'px'});
            $('#box_sticker_angle_left').css({'height': sticker_default_angle_left['height_sticker'] + 'px'});

            $('#message_view_stickers').addClass('hidden');


            //for save
            $('[name = x_sticker]').val(sticker_default_angle_left['x_sticker']);
            $('[name = y_sticker]').val(sticker_default_angle_left['y_sticker']);
            $('[name = width_sticker]').val(sticker_default_angle_left['width_sticker']);
            $('[name = height_sticker]').val(sticker_default_angle_left['height_sticker']);


        }
        if (this.value == 2) //Label
        {
            $('#box_sticker_angle_right').addClass('hidden');
            $('#box_sticker_angle_left').addClass('hidden');
            $('#label_sticker').removeClass('hidden');
            $('#horizontal_strip_sticker').addClass('hidden');
            $('#image_sticker').addClass('hidden');
            $('#label_stylized_sticker').addClass('hidden');

            $('#box_sticker').removeClass('hidden');


            $('#sticker_block_basis').fadeIn();
            $('#sticker_block_WHTP').fadeIn();
            $('#sticker_block_image').fadeOut();
            $('#sticker_block_horizontal_strip').fadeOut();

            $('#message_view_stickers').removeClass('hidden');

            $('[name = x_sticker]').val(sticker_default_label['x_sticker']).keyup();
            $('[name = y_sticker]').val(sticker_default_label['y_sticker']).keyup();
            $('[name = width_sticker]').val(sticker_default_label['width_sticker']).keyup();
            $('[name = height_sticker]').val(sticker_default_label['height_sticker']).keyup();

            $("#box_sticker").css({'overflow': 'hidden'});
            $("#box_sticker").removeClass('box_sticker_left');

            $("#box_sticker").draggable('destroy');
            $("#box_sticker").draggable(
                {
                    drag: function(event, ui) {
                        $('[name = x_sticker]').val(Math.round(ui.position.left));
                        $('[name = y_sticker]').val(Math.round(ui.position.top));
                    }
                }
            );
            updateStikcerView();

        }
        if (this.value == 3) //horizontal_strip
        {
            $('#box_sticker_angle_right').addClass('hidden');
            $('#box_sticker_angle_left').addClass('hidden');
            $('#label_sticker').addClass('hidden');
            $('#horizontal_strip_sticker').removeClass('hidden');
            $('#image_sticker').addClass('hidden');
            $('#label_stylized_sticker').addClass('hidden');

            $('#box_sticker').removeClass('hidden');

            $('#sticker_block_basis').fadeIn();
            $('#sticker_block_image').fadeOut();
            $('#sticker_block_WHTP').fadeOut();
            $('#sticker_block_horizontal_strip').fadeIn();

            $('#message_view_stickers').removeClass('hidden');


            $('#box_sticker').css({'width': sticker_default_horizontal_strip['width_sticker'] + 'px'});
            $('#box_sticker').css({'left': sticker_default_horizontal_strip['x_sticker'] + 'px'});
            //    $('[name = x_sticker]').val(sticker_default_horizontal_strip['x_sticker']).keyup();
            $('[name = y_sticker]').val(sticker_default_horizontal_strip['y_sticker']).keyup();
            // $('[name = width_sticker]').val(sticker_default_horizontal_strip['width_sticker']).keyup();
            $('[name = height_sticker]').val(sticker_default_horizontal_strip['height_sticker']).keyup();


            //for save
            $('[name = x_sticker]').val(sticker_default_horizontal_strip['x_sticker']);
            $('[name = width_sticker]').val(sticker_default_horizontal_strip['width_sticker']);

            $("#box_sticker").css({'overflow': 'hidden'});
            $("#box_sticker").removeClass('box_sticker_left');



            $("#box_sticker").draggable('destroy');
            $("#box_sticker").draggable(
                {
                    drag: function(event, ui) {
                        $('[name = x_sticker]').val('0');
                        $('[name = y_sticker]').val(Math.round(ui.position.top));
                    }
                }
            );
            updateStikcerView();
            $("#box_sticker").draggable('option', 'axis', 'y');

        }
        if (this.value == 4) //Image
        {
            $('#box_sticker_angle_right').addClass('hidden');
            $('#box_sticker_angle_left').addClass('hidden');
            $('#label_sticker').addClass('hidden');
            $('#horizontal_strip_sticker').addClass('hidden');
            $('#image_sticker').removeClass('hidden');
            $('#label_stylized_sticker').addClass('hidden');

            $('#box_sticker').removeClass('hidden');


            $('#sticker_block_basis').fadeOut();
            $('#sticker_block_image').fadeIn();
            $('#sticker_block_WHTP').fadeIn();
            $('#sticker_block_horizontal_strip').fadeOut();

            $('#message_view_stickers').removeClass('hidden');

            $('[name = x_sticker]').val(sticker_default_image['x_sticker']).keyup();
            $('[name = y_sticker]').val(sticker_default_image['y_sticker']).keyup();
            $('[name = width_sticker]').val(sticker_default_image['width_sticker']).keyup();
            $('[name = height_sticker]').val(sticker_default_image['height_sticker']).keyup();


            $("#box_sticker").css({'overflow': 'visible'});
            $("#box_sticker").removeClass('box_sticker_left');

            $("#box_sticker").draggable('destroy');
            $("#box_sticker").draggable(
                {
                    drag: function(event, ui) {
                        $('[name = x_sticker]').val(Math.round(ui.position.left));
                        $('[name = y_sticker]').val(Math.round(ui.position.top));
                    }
                }
            );
            updateStikcerView();


        }
        if (this.value == 5) //Label stylized
        {
            $('#box_sticker_angle_right').addClass('hidden');
            $('#box_sticker_angle_left').addClass('hidden');
            $('#label_sticker').addClass('hidden');
            $('#horizontal_strip_sticker').addClass('hidden');
            $('#image_sticker').addClass('hidden');
            $('#label_stylized_sticker').removeClass('hidden');

            $('#box_sticker').removeClass('hidden');


            $('#sticker_block_basis').fadeIn();
            $('#sticker_block_WHTP').fadeIn();
            $('#sticker_block_image').fadeOut();
            $('#sticker_block_horizontal_strip').fadeOut();

            $('#message_view_stickers').removeClass('hidden');

            $('[name = x_sticker]').val(sticker_default_label_stylized['x_sticker']).keyup();
            $('[name = y_sticker]').val(sticker_default_label_stylized['y_sticker']).keyup();
            $('[name = width_sticker]').val(sticker_default_label_stylized['width_sticker']).keyup();
            $('[name = height_sticker]').val(sticker_default_label_stylized['height_sticker']).keyup();

            $("#box_sticker").css({'overflow': 'hidden'});
            $("#box_sticker").removeClass('box_sticker_left');

            $("#box_sticker").draggable('destroy');
            $("#box_sticker").draggable(
                {
                    drag: function(event, ui) {
                        $('[name = x_sticker]').val(Math.round(ui.position.left));
                        $('[name = y_sticker]').val(Math.round(ui.position.top));
                    }
                }
            );
            updateStikcerView();

        }

    });


    var angle_right_sticker = $("#angle_right_sticker");
    var angle_left_sticker = $("#angle_left_sticker");
    var label_sticker = $("#label_sticker");
    var horizontal_strip_sticker = $("#horizontal_strip_sticker");
    var image_sticker = $("#image_sticker");
    var label_stylized_sticker = $("#label_stylized_sticker");

    angle_right_sticker.addClass(getClassColor($('[name = color_background_sticker]').val(), 0, 0));
    angle_left_sticker.addClass(getClassColor($('[name = color_background_sticker]').val(), 0, 0));



    $('[name = text_sticker]').keyup(function () {
        var Value = $('[name = text_sticker]').val();
        angle_right_sticker.text(Value);
        angle_left_sticker.text(Value);
        label_sticker.text(Value);
        horizontal_strip_sticker.text(Value);
        label_stylized_sticker.text(Value);

    });

    $("[name = size_font_sticker]").change(function () {
        var Value = $('[name = size_font_sticker]').val() + 'px';
        angle_right_sticker.css({'font-size': Value});
        angle_left_sticker.css({'font-size': Value});
        label_sticker.css({'font-size': Value});
        horizontal_strip_sticker.css({'font-size': Value});
        label_stylized_sticker.css({'font-size': Value});
        updateStikcerView();
    });

    $("[name = color_font_sticker]").change(function () {
        var Value = $('[name = color_font_sticker]').val();
        angle_right_sticker.css({'color': Value});
        angle_left_sticker.css({'color': Value});
        label_sticker.css({'color': Value});
        horizontal_strip_sticker.css({'color': Value});
        label_stylized_sticker.css({'color': Value});

    });

    $("[name = color_background_sticker]").change(function () {
        var Value = $('[name = color_background_sticker]').val();
        angle_right_sticker.css({'background': Value});
        angle_left_sticker.css({'background': Value});
        label_sticker.css({'background': Value});
        horizontal_strip_sticker.css({'background': Value});
        label_stylized_sticker.css({'background': Value});

        angle_right_sticker.addClass(getClassColor(Value, 1, 0));
        angle_left_sticker.addClass(getClassColor(Value, 1, 1));
    });



    function getClassColor(Value, remove_class, type_sticker) {

        if(remove_class) {
            if(type_sticker == 0) {
                angle_right_sticker.removeClass();
                angle_right_sticker.addClass('angle_right_sticker');
            }
            if(type_sticker == 1) {
                angle_left_sticker.removeClass();
                angle_left_sticker.addClass('angle_left_sticker');
            }
        }


        if(Value.length !== 7) {
            return true;
        }
        var stringRGB = Value.substr(1);

        var red = 0;
        var green = 0;
        var blue = 0;


        if (stringRGB.length == 6) {
            red = stringRGB.charAt(0) + stringRGB.charAt(1);
            green = stringRGB.charAt(2) + stringRGB.charAt(3);
            blue = stringRGB.charAt(4) + stringRGB.charAt(5);
        }
        red = parseInt(red, 16);
        green = parseInt(green, 16);
        blue = parseInt(blue, 16);



        var class_color = '';

        var half_color = 128;
        var whole_color = 190;

        var check_red = 0; //0-<128 128<x<190 190<x
        var check_green = 0;
        var check_blue = 0;

        if(red < half_color) {
            check_red = 0;
        }
        if(half_color < red && red< whole_color) {
            check_red = 1;
        }
        if(whole_color < red){
            check_red = 2;
        }

        if(green < half_color) {
            check_green = 0;
        }
        if(half_color < green && green < whole_color) {
            check_green = 1;
        }
        if(whole_color < green){
            check_green = 2;
        }

        if(blue < half_color) {
            check_blue = 0;
        }
        if(half_color < blue && blue < whole_color) {
            check_blue = 1;
        }
        if(whole_color < blue){
            check_blue = 2;
        }


        if(check_red == 0) { //0
            if(check_green == 0) { //0 0
                if (check_blue == 0) {
                    class_color = 'black'; //0 0 0
                }
                if (check_blue == 1) {
                    class_color = 'saturated_blue'; //0 0 170
                }
                if (check_blue == 2) {
                    class_color = 'super_blue'; //0 0 240
                }
            }
            if(check_green == 1) { //0 170
                if (check_blue == 0) {
                    class_color = 'green'; //0 170 0
                }
                if (check_blue == 1) {
                    class_color = 'lada'; //0 170 170
                }
                if (check_blue == 2) {
                    class_color = 'blue'; //0 170 240
                }
            }
            if(check_green == 2) { //0 240
                if (check_blue == 0) {
                    class_color = 'saturated_green'; //0 240 0
                }
                if (check_blue == 1) {
                    class_color = 'easy_green'; //0 240 170
                }
                if (check_blue == 2) {
                    class_color = 'saturated_ocean';  //0 240 240
                }
            }
        }


        if(check_red == 1) { //170
            if(check_green == 0) { //170 0
                if (check_blue == 0) {
                    class_color = 'saturated_red'; //170 0 0
                }
                if (check_blue == 1) {
                    class_color = 'gray_blue'; //170 0 170
                }
                if (check_blue == 2) {
                    class_color = 'purple_blue'; //170 0 240
                }
            }
            if(check_green == 1) { //170 170
                if (check_blue == 0) {
                    class_color = 'saturated_olive'; //170 170 0
                }
                if (check_blue == 1) {
                    class_color = 'gray'; //170 170 170
                }
                if (check_blue == 2) {
                    class_color = 'ocean'; //170 170 240
                }
            }
            if(check_green == 2) { //170 240
                if (check_blue == 0) {
                    class_color = 'easy_olive'; //170 240 0
                }
                if (check_blue == 1) {
                    class_color = 'olive'; //170 240 170
                }
                if (check_blue == 2) {
                    class_color = 'plastic';  //170 240 240
                }
            }
        }

        if(check_red == 2) { //240
            if (check_green == 0) { //240 0
                if (check_blue == 0) {
                    class_color = 'red'; //240 0 0
                }
                if (check_blue == 1) {
                    class_color = 'purple_red'; //240 0 170
                }
                if (check_blue == 2) {
                    class_color = 'saturated_purple'; //240 0 240
                }
            }
            if (check_green == 1) { //240 170
                if (check_blue == 0) {
                    class_color = 'brown'; //240 170 0
                }
                if (check_blue == 1) {
                    class_color = 'pink'; //240 170 170
                }
                if (check_blue == 2) {
                    class_color = 'purple'; //240 170 240
                }
            }
            if (check_green == 2) { //240 240
                if (check_blue == 0) {
                    class_color = 'easy_brown'; //240 240 0
                }
                if (check_blue == 1) {
                    class_color = 'flesh'; //240 240 170
                }
                if (check_blue == 2) {
                    class_color = 'easy_gray';  //240 240 240
                }
            }
        }

        //$('[name = text_sticker]').val('check_red ' + check_red + ' check_green ' + check_green +' check_blue  ' + check_blue);
        //angle_right_sticker.text(class_color);
        //angle_left_sticker.text(class_color);
        return class_color;

    }



    $('[name = x_sticker]').keyup(function () {
        $("#box_sticker").css({'left': Math.round($('[name = x_sticker]:visible').val()) + 'px'})
    });

    $('[name = y_sticker]').keyup(function () {
        $('[name = y_sticker]').val(this.value); //Kostil
        $("#box_sticker").css({'top': Math.round($('[name = y_sticker]:visible').val()) + 'px'})
    });

    $('[name = width_sticker]').keyup(function () {
        $("#box_sticker").css({'width': $('[name = width_sticker]:visible').val() + 'px'});
        image_sticker.attr('width', $('[name = width_sticker]:visible').val());
        updateStikcerView();
    });

    $('[name = height_sticker]').keyup(function () {
        $("#box_sticker").css({'height': $('[name = height_sticker]:visible').val() + 'px'});
        image_sticker.attr('height', $('[name = height_sticker]:visible').val());
        updateStikcerView();
    });


    //IMAGE LOAD
    var thumbnail_max_files = 3
    $('#thumbnail-selectbutton').click(function (e) {
        $('#thumbnail').trigger('click');
    });
    $('#thumbnail-name').click(function (e) {
        $('#thumbnail').trigger('click');
    });
    $('#thumbnail-name').on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    $('#thumbnail-name').on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    $('#thumbnail-name').on('drop', function (e) {
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;
        $('#thumbnail')[0].files = files;
        $(this).val(files[0].name);
    });
    $('#thumbnail').change(function (e) {
        if ($(this)[0].files !== undefined) {
            var files = $(this)[0].files;
            var name = '';
            $.each(files, function (index, value) {
                name += value.name + ', ';
            });
            $('#thumbnail-name').val(name.slice(0, -2));
        } else // Internet Explorer 9 Compatibility
        {
            var name = $(this).val().split(/[\\/]/);
            $('#thumbnail-name').val(name[name.length - 1]);
        }
    });
    if (typeof thumbnail_max_files !== 'undefined') {
        $('#thumbnail').closest('form').on('submit', function (e) {
            if ($('#thumbnail')[0].files.length > thumbnail_max_files) {
                e.preventDefault();
                alert('You can upload a maximum of 3 files');
            }
        });
    }

});
