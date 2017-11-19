<?php
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

function upgrade_module_1_0_2($module)
{
    return true;
}
function upgrade_module_1_1_0($module)
{
    return true;
}
function upgrade_module_1_1_1($module)
{
    $sql = "INSERT INTO " . _DB_PREFIX_ . "stickers_default_bobs
            (id_sticker, name, title, activate, visible_inside, image_type_sticker,
            text_sticker, type_sticker, subtype_sticker, color_font_sticker,
            color_background_sticker, size_font_sticker, x_sticker, y_sticker,
            width_sticker, height_sticker
            ) VALUES (
            '6', 'label_stylized', 'Sale!', '1', '1', '.png', 'Sale!', '5', '0',
            '#ffffff', '#2fb5d2', '15', '-6', '10', '71', '30')";
    if (!Db::getInstance()->execute($sql)) {
        return false;
    }
    return $module->registerHook('actionFrontControllerSetMedia');
}
