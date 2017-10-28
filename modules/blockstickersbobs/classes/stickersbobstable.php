<?php
/*
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

class StickersBobsTable extends ObjectModel
{
    public $id_sticker;

    public $name;

    public $title;

    public $activate;

    public $visible_inside;

    public $image_type_sticker;

    public $text_sticker;

    public $type_sticker;

    public $subtype_sticker;

    public $color_font_sticker;

    public $color_background_sticker;

    public $size_font_sticker;

    public $x_sticker;

    public $y_sticker;

    public $width_sticker;

    public $height_sticker;


    /**
     * @see ObjectModel::$definition
     */
    public static $definition = array(
        'table' => 'stickers_default_bobs',
        'primary' => 'id_sticker',
        'multilang' => false,
        'fields' => array(
            'name' =>				array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'title' =>				array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'activate' =>				array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'visible_inside' =>				array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'image_type_sticker' =>				array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'text_sticker' =>				array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'type_sticker' =>				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'subtype_sticker' =>				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'color_font_sticker' =>				array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'color_background_sticker' =>				array('type' => self::TYPE_STRING, 'validate' => 'isString'),
            'size_font_sticker' =>				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'x_sticker' =>				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'y_sticker' =>				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'width_sticker' =>				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
            'height_sticker' =>				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt'),
        )
    );

}
