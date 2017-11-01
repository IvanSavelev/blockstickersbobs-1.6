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

class StickersProductsBobsTable extends ObjectModel
{
    public $id;

    public $id_product;

    public $id_sticker;



    /**
     * @see ObjectModel::$definition
     */
    public static $definition = array(
        'table' => 'stickers_products_bobs',
        'primary' => 'id',
        'multilang' => false,
        'fields' => array(
            'id' =>				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
            'id_product' =>				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
            'id_sticker' =>				array('type' => self::TYPE_INT, 'validate' => 'isUnsignedId'),
        )
    );

    /**
     * Returns array stickers
     *
     * @return array
     */
    public static function getStickersProducts()
    {
        $sql = '
                    SELECT
                    *
                    FROM ' . _DB_PREFIX_ . 'stickers_products_bobs';
        return  Db::getInstance()->executeS($sql);
    }


    /**
     * @param $id_product
     *
     * @return mixed
     */
    public static function getStickersProduct($id_product)
    {

        $sql = '
                    SELECT
                    *
                    FROM ' . _DB_PREFIX_ . 'stickers_products_bobs
                    WHERE `id_product`=' . (int)$id_product;
        return Db::getInstance()->executeS($sql);
    }

}
