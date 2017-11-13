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
 *  @author PrestaShop SA <contact@prestashop.com>
 *  @copyright  2007-2016 PrestaShop SA
 *  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 **/

include_once(_PS_MODULE_DIR_ . 'blockstickersbobs/blockstickerbobsmodel.php');
include_once(_PS_MODULE_DIR_ . 'blockstickersbobs/classes/stickersdefaultbobstable.php');
include_once(_PS_MODULE_DIR_ . 'blockstickersbobs/classes/stickersbobstable.php');
include_once(_PS_MODULE_DIR_ . 'blockstickersbobs/classes/stickersproductsbobstable.php');
class BlockStickersBobs extends Module
{

    const _WIDTH_BOX_ = 250;
    const URL_DEFAULT_IMG = '/modules/blockstickersbobs/views/img/default_image.png';
    protected $tabl_stickers_front = array();


    public function __construct()
    {
        $this->name = 'blockstickersbobs';
        $this->tab = 'front_office_features';
        $this->version = '1.1.0';
        $this->author = 'Ivan Savelev';
        $this->need_instance = 0;
        $this->bootstrap = true;
        parent::__construct();
        $this->displayName = $this->l('Modified Bobs stickers');
        $this->description = $this->l('Block for creation of your own labels on product images.');
        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
        $this->module_key = '3175e42b6d1c00fa6c9d1f7c088832b0';
    }

    public function install()
    {
        if ($this->installStickerBobs() && $this->installStickerDefaultBobs() && $this->installStickersProductsBobs()) {
        } else {
            return false;
        }

        return parent::install() &&
               $this->registerHook('header') &&
               $this->registerHook('displayProductTabContent') &&
               $this->registerHook('displayProductListReviews');
    }


    private function installStickerBobs()
    {
        if (!BlockStickersBobsModel::createStickersBobsTable()) {
            return false;
        }

        for ($id = 1; $id < 6; $id ++) {
            $stickers_bobs_table = new StickersBobsTable();
            if ($id == 1) {
                $stickers_bobs_table->name = "Sticker №1";
                $stickers_bobs_table->text_sticker = "Sale!";
                $stickers_bobs_table->color_font_sticker = '#ffffff';
                $stickers_bobs_table->color_background_sticker = '#ff0000';
                $stickers_bobs_table->size_font_sticker = '10';
                $stickers_bobs_table->x_sticker = - 4;
                $stickers_bobs_table->y_sticker = - 3;
                $stickers_bobs_table->width_sticker = 85;
                $stickers_bobs_table->height_sticker = 85;
                $stickers_bobs_table->type_sticker = 0;
            }
            if ($id == 2) {
                $stickers_bobs_table->name = "Sticker №2";
                $stickers_bobs_table->text_sticker = "Sale!";
                $stickers_bobs_table->color_font_sticker = '#ffffff';
                $stickers_bobs_table->color_background_sticker = '#c600b9';
                $stickers_bobs_table->size_font_sticker = '10';
                $stickers_bobs_table->x_sticker = - 3;
                $stickers_bobs_table->y_sticker = - 4;
                $stickers_bobs_table->width_sticker = 85;
                $stickers_bobs_table->height_sticker = 85;
                $stickers_bobs_table->type_sticker = 1;
            }
            if ($id == 3) {
                $stickers_bobs_table->name = "Sticker №3";
                $stickers_bobs_table->text_sticker = "Sale!";
                $stickers_bobs_table->color_font_sticker = '#ffffff';
                $stickers_bobs_table->color_background_sticker = '#5453ff';
                $stickers_bobs_table->size_font_sticker = '10';
                $stickers_bobs_table->x_sticker = 142;
                $stickers_bobs_table->y_sticker = 12;
                $stickers_bobs_table->width_sticker = 85;
                $stickers_bobs_table->height_sticker = 30;
                $stickers_bobs_table->type_sticker = 2;
            }
            if ($id == 4) {
                $stickers_bobs_table->name = "Sticker №4";
                $stickers_bobs_table->text_sticker = "Sale!";
                $stickers_bobs_table->color_font_sticker = '#005dc3';
                $stickers_bobs_table->color_background_sticker = '#a4ffc3';
                $stickers_bobs_table->size_font_sticker = '10';
                $stickers_bobs_table->x_sticker = 0;
                $stickers_bobs_table->y_sticker = 10;
                $stickers_bobs_table->width_sticker = 250;
                $stickers_bobs_table->height_sticker = 20;
                $stickers_bobs_table->type_sticker = 3;
            }
            if ($id == 5) {
                $stickers_bobs_table->name = "Sticker №5";
                $stickers_bobs_table->text_sticker = "Sale!";
                $stickers_bobs_table->color_font_sticker = '#ffffff';
                $stickers_bobs_table->color_background_sticker = '#ff0000';
                $stickers_bobs_table->size_font_sticker = '10';
                $stickers_bobs_table->x_sticker = 190;
                $stickers_bobs_table->y_sticker = 4;
                $stickers_bobs_table->width_sticker = 50;
                $stickers_bobs_table->height_sticker = 50;
                $stickers_bobs_table->type_sticker = 4;
            }

            $stickers_bobs_table->title = 'title';
            $stickers_bobs_table->activate = 1;
            $stickers_bobs_table->visible_inside = 1;
            $stickers_bobs_table->image_type_sticker = '.png';
            $stickers_bobs_table->subtype_sticker = 0;

            $stickers_bobs_table->save();
        }

        return true;
    }


    private function installStickerDefaultBobs()
    {
        if (!BlockStickersBobsModel::createStickersDefaultBobsTable()) {
            return false;
        }

        for ($type_sticker = 0; $type_sticker < 5; $type_sticker ++) {
            $stickers_default_bobs_table =new StickersDefaultBobsTable();

            if ($type_sticker == 0) {
                $stickers_default_bobs_table->name = "angle_right";
                $stickers_default_bobs_table->text_sticker = "Sale!";
                $stickers_default_bobs_table->color_font_sticker = '#ffffff';
                $stickers_default_bobs_table->color_background_sticker = '#ff0000';
                $stickers_default_bobs_table->size_font_sticker = 10;
                $stickers_default_bobs_table->x_sticker = - 4;
                $stickers_default_bobs_table->y_sticker = - 3;
                $stickers_default_bobs_table->width_sticker = 85;
                $stickers_default_bobs_table->height_sticker = 85;
            }
            if ($type_sticker == 1) {
                $stickers_default_bobs_table->name = "angle_left";
                $stickers_default_bobs_table->text_sticker = "Sale!";
                $stickers_default_bobs_table->color_font_sticker = '#ffffff';
                $stickers_default_bobs_table->color_background_sticker = '#c600b9';
                $stickers_default_bobs_table->size_font_sticker = 10;
                $stickers_default_bobs_table->x_sticker = - 3;
                $stickers_default_bobs_table->y_sticker = - 4;
                $stickers_default_bobs_table->width_sticker = 85;
                $stickers_default_bobs_table->height_sticker = 85;
            }
            if ($type_sticker == 2) {
                $stickers_default_bobs_table->name = "label";
                $stickers_default_bobs_table->text_sticker = "Sale!";
                $stickers_default_bobs_table->color_font_sticker = '#ffffff';
                $stickers_default_bobs_table->color_background_sticker = '#5453ff';
                $stickers_default_bobs_table->size_font_sticker = 10;
                $stickers_default_bobs_table->x_sticker = 142;
                $stickers_default_bobs_table->y_sticker = 12;
                $stickers_default_bobs_table->width_sticker = 85;
                $stickers_default_bobs_table->height_sticker = 30;
            }
            if ($type_sticker == 3) {
                $stickers_default_bobs_table->name = "horizontal_strip";
                $stickers_default_bobs_table->text_sticker = "Sale!";
                $stickers_default_bobs_table->color_font_sticker = '#005dc3';
                $stickers_default_bobs_table->color_background_sticker = '#a4ffc3';
                $stickers_default_bobs_table->size_font_sticker = 10;
                $stickers_default_bobs_table->x_sticker = 0;
                $stickers_default_bobs_table->y_sticker = 10;
                $stickers_default_bobs_table->width_sticker = 250;
                $stickers_default_bobs_table->height_sticker = 20;
            }
            if ($type_sticker == 4) {
                $stickers_default_bobs_table->name = "image";
                $stickers_default_bobs_table->text_sticker = "Sale!";
                $stickers_default_bobs_table->color_font_sticker = '#ffffff';
                $stickers_default_bobs_table->color_background_sticker = '#ff0000';
                $stickers_default_bobs_table->size_font_sticker = 10;
                $stickers_default_bobs_table->x_sticker = 190;
                $stickers_default_bobs_table->y_sticker = 4;
                $stickers_default_bobs_table->width_sticker = 50;
                $stickers_default_bobs_table->height_sticker = 50;
            }

            $stickers_default_bobs_table->title = "Sale!";
            $stickers_default_bobs_table->activate = 1;
            $stickers_default_bobs_table->visible_inside = 1;
            $stickers_default_bobs_table->image_type_sticker = '.png';
            $stickers_default_bobs_table->type_sticker = $type_sticker;
            $stickers_default_bobs_table->subtype_sticker = 0;



            $stickers_default_bobs_table->save();
        }

        return true;
    }

    private function installStickersProductsBobs()
    {
        return BlockStickersBobsModel::createStickersProductsBobsTable();
    }


    public function uninstall()
    {
        $image_type_and_id_stickers = StickersBobsTable::getImagesType();
        foreach ($image_type_and_id_stickers as $image_type_and_id_sticker) {
            $path_image_old = $this->local_path .
                              'views/img/' .
                              $image_type_and_id_sticker['id_sticker'] .
                              $image_type_and_id_sticker['image_type_sticker'];
            if (file_exists($path_image_old)) {
                unlink($path_image_old); //Delete Old image
            }
        }

        BlockStickersBobsModel::deleteTables();

        return parent::uninstall();
    }


    public function hookDisplayHeader($params)
    {

        $this->context->controller->addCSS($this->_path . 'views/css/stickers.css', 'all');
        $this->context->controller->addJs($this->_path . 'views/js/stickers_bobs.js', 'all');
        $this->context->controller->addJs($this->_path . 'views/js/sticker_bobs.js', 'all');

        $stickers = StickersBobsTable::getStickers();

        //normalize left Top ...
        $block_canvas = self::_WIDTH_BOX_ / 2;
        foreach ($stickers as $key => $sticker) {
            if ($sticker['type_sticker'] == 0) {    //Right angle
                $stickers[$key]['type_position_y'] = 'T';
                $stickers[$key]['type_position_x'] = 'R';
                continue;
            }
            if ($sticker['type_sticker'] == 1) {    //Left angle
                $stickers[$key]['type_position_y'] = 'T';
                $stickers[$key]['type_position_x'] = 'L';
                continue;
            }
            if ($sticker['y_sticker'] < $block_canvas) {    //top
                $stickers[$key]['type_position_y'] = 'T';
            } else {    //bottom
                $stickers[$key]['type_position_y'] = 'B';
                $stickers[$key]['y_sticker'] = self::_WIDTH_BOX_ -
                                               (int)$sticker['y_sticker'] -
                                               (int)$sticker['height_sticker'];
            }
            if ($sticker['x_sticker'] < $block_canvas) {    //left
                $stickers[$key]['type_position_x'] = 'L';
            } else {
                $stickers[$key]['type_position_x'] = 'R';
                $stickers[$key]['x_sticker'] = self::_WIDTH_BOX_ -
                                               (int)$sticker['x_sticker'] -
                                               (int)$sticker['width_sticker'] - 2;
            }
        }
        $this->addCurrentUrlImgSt($stickers);
        $this->tabl_stickers_front = $stickers;
    }


    public function hookDisplayProductListReviews($params)
    {
        if (empty($this->tabl_stickers_front)) {
            $this->hookDisplayHeader(null);
        }
        return $this->renderFrontSticker($params);
    }


    public function hookDisplayProductTabContent($params)
    {
        return $this->renderFrontSticker($params, true);
    }

    private function renderFrontSticker($params, $views_product_display = false)
    {
        if ($views_product_display) {
            $stickers = $this->frontViewSticker(Tools::getValue('id_product'));
            $id_product = Tools::getValue('id_product');
        } else {
            $stickers = $this->frontViewStickers($params['product']['id_product']);
            $id_product = $params['product']['id_product'];
        }

        if (!$this->isCached('views/templates/front/sticker_bobs.tpl', $this->getCacheId((int)$id_product))) {
            if (isset($stickers)) {
                $this->smarty->assign(array(
                    'stickers' => $stickers
                ));
            }
        }

        return $this->display(__FILE__, 'views/templates/front/sticker_bobs.tpl', $this->getCacheId((int)$id_product));
    }


    private function frontViewSticker($id_product)
    {
        $stickers_products_id = StickersProductsBobsTable::getStickersProduct($id_product);
        $stickers = array();
        foreach ($stickers_products_id as $sticker_products_id) {
            foreach ($this->tabl_stickers_front as $sticker) {
                if ($sticker['id_sticker'] == $sticker_products_id['id_sticker'] && $sticker['visible_inside'] != 0) {
                    $sticker['class_color_corners'] = $this->getClassColor($sticker['color_background_sticker']);
                    $stickers[] = $sticker;
                    break;
                }
            }
        }
        return $stickers;
    }


    private function frontViewStickers($id_product)
    {
        $stickers_products_id = StickersProductsBobsTable::getStickersProduct($id_product);
        $stickers = array();
        foreach ($stickers_products_id as $sticker_products_id) {
            foreach ($this->tabl_stickers_front as $sticker) {
                if ($sticker['id_sticker'] == $sticker_products_id['id_sticker']) {
                    $sticker['class_color_corners'] = $this->getClassColor($sticker['color_background_sticker']);
                    $stickers[] = $sticker;
                    break;
                }
            }
        }
        return $stickers;
    }


    /**
     * Insert in array of the path to image
     *
     * @param array $stickers
     *
     * @return array
     * @author  Bobs
     */
    private function addCurrentUrlImgSt(array &$stickers)
    {
        foreach ($stickers as $key => $sticker) {
            if (file_exists(
                $this->local_path .
                'views/img/' .
                $sticker['id_sticker'] .
                $sticker['image_type_sticker']
            )) { //There is file image
                $stickers[$key]['current_url_img'] = $this->_path . 'views/img/' .
                                                     $sticker['id_sticker'] .
                                                     $sticker['image_type_sticker'];
            } else {
                $stickers[$key]['current_url_img'] = $this::URL_DEFAULT_IMG;
            }
        }

        return $stickers;
    }


    public function getContent()
    {
        $html = '';

        // If you keep the change from admin save the changes to the database, and clear the cache
        if (Tools::isSubmit('delete_image_sticker')) {
            $this->deleteImageSticker(Tools::getValue('id_sticker'));
            $html .= $this->displayConfirmation($this->l('Configuration updated'));
        }
        if (Tools::isSubmit('save_sticker')) {
            $this->saveSticker();
            $html .= $this->displayConfirmation($this->l('Configuration updated'));
        }
        if (Tools::isSubmit('save_sticker_product')) {
            $this->saveStickerProduct();
            $html .= $this->displayConfirmation($this->l('Configuration updated'));
        }
        if (Tools::isSubmit('delete_stickers')) {
            $this->deleteStickers(Tools::getValue('delete_stickers'));
            $html .= $this->displayConfirmation($this->l('Uninstall completed'));
        }
        if (Tools::isSubmit('delete_sticker')) {
            $this->deleteSticker(Tools::getValue('delete_sticker'));
            $html .= $this->displayConfirmation($this->l('Uninstall completed'));
        }


        if (Tools::isSubmit('redirect')) {
            switch (Tools::getValue('redirect')) {
                case 'stickers':
                    $html .= $this->renderStickers();
                    break;
                case 'sticker':
                    $html .= $this->renderSticker();
                    break;
                case 'openproduct':
                    $html .= $this->renderOpenProduct((int)Tools::getValue('id_product'));
                    break;
                case 'entry':
                    $html .= $this->renderEntry();
                    break;
            }
            return $html;
        }

        $html .= $this->renderEntry();
        return $html;
    }


    public function saveSticker()
    {

        // id sticker
        if (Tools::isSubmit('id_sticker')) {
            $id_sticker = Tools::getValue('id_sticker');
        } else {
            $id_sticker = StickersBobsTable::getMaxID() + 1;
        }

        /*$subtype_sticker = 1;
        if (Tools::isSubmit('subtype_sticker')) {
            $subtype_sticker = Tools::getValue('subtype_sticker');
        }*/

        //old_image_type
        $old_image_type = StickersBobsTable::getImageType($id_sticker);

        //main code update picture
        if (isset($_FILES['thumbnail']) && $_FILES['thumbnail']['size'] > 0) {
            if (isset($_FILES['thumbnail']['tmp_name']) && !empty($_FILES['thumbnail']['tmp_name'])) {
                if ($error = ImageManager::validateUpload($_FILES['thumbnail'], 4000000)) {
                    $this->errors[] = $error;     //Size control
                    return false;
                }

                $tmp_name = tempnam(_PS_TMP_IMG_DIR_, 'PS');
                if (!$tmp_name) {
                    $this->errors[] = 'Error create temp file';
                    return false;
                }

                if (!move_uploaded_file($_FILES['thumbnail']['tmp_name'], $tmp_name)) { //File transfer in temp
                    $this->errors[] = 'Error file transfer in temp';
                    return false;
                }

                // Evaluate the memory required to resize the image: if it's too much, you can't resize it.
                if (!ImageManager::checkImageMemoryLimit($tmp_name)) {
                    $this->errors[] = Tools::displayError('Due to memory limit restrictions, this image cannot be
                    loaded. Please increase your memory_limit value via your server\'s configuration settings. ');
                    unlink($tmp_name);
                    return false;
                }

                if ($old_image_type) {
                    $path_image_old = $this->local_path . 'views/img/' .
                                      Tools::getValue('id_sticker') . $old_image_type;
                    if (file_exists($path_image_old)) {
                        unlink($path_image_old); //Delete Old image
                    }
                }

                $path_image_new = $this->local_path . 'views/img/' .
                                  $id_sticker . strrchr(Tools::getValue('filename'), '.');
                if (empty($this->errors) && !ImageManager::resize($tmp_name, $path_image_new, null, null)) {
                    $this->errors[] = Tools::displayError('An error occurred while uploading the image.');
                    unlink($tmp_name);
                    return false;
                }
                unlink($tmp_name);
            }
        }
        $image_type_sticker = strrchr(Tools::getValue('filename'), '.');
        if (empty($image_type_sticker)) { //if new image not-> old image $image_type_sticker
            $image_type_sticker = $old_image_type;
        }

        $stickers_bobs_table = new StickersBobsTable($id_sticker);

        $stickers_bobs_table->name = Tools::getValue('name');
        $stickers_bobs_table->title = Tools::getValue('title');
        $stickers_bobs_table->activate = Tools::getValue('activate');
        $stickers_bobs_table->visible_inside = Tools::getValue('visible_inside');
        $stickers_bobs_table->image_type_sticker = $image_type_sticker;
        $stickers_bobs_table->text_sticker = Tools::getValue('text_sticker');
        $stickers_bobs_table->type_sticker = Tools::getValue('type_sticker');
        $stickers_bobs_table->subtype_sticker = 0;
        $stickers_bobs_table->color_font_sticker = Tools::getValue('color_font_sticker');
        $stickers_bobs_table->color_background_sticker = Tools::getValue('color_background_sticker');
        $stickers_bobs_table->size_font_sticker = Tools::getValue('size_font_sticker');
        $stickers_bobs_table->x_sticker = Tools::getValue('x_sticker');
        $stickers_bobs_table->y_sticker = Tools::getValue('y_sticker');
        $stickers_bobs_table->width_sticker = Tools::getValue('width_sticker');
        $stickers_bobs_table->height_sticker = Tools::getValue('height_sticker');

        if ($stickers_bobs_table->save()) {
            Tools::clearSmartyCache();
            return true;
        } else {
            $this->errors[] = Tools::displayError('Error update BD');
            return false;
        }
    }


    public function saveStickerProduct()
    {
        $id_product = Tools::getValue('id_product');
        //DELETE Field
        if (!StickersProductsBobsTable::deleteOfProduct($id_product)) {
            $this->errors[] = Tools::displayError('Error delete field BD');
        }
        if (Tools::isSubmit('checkbox_sticker')) {
            foreach (Tools::getValue('checkbox_sticker') as $id_sticker) {
                $stickers_product_bobs_table = new StickersProductsBobsTable();
                $stickers_product_bobs_table->id_sticker = $id_sticker;
                $stickers_product_bobs_table->id_product = $id_product;
                if (!$stickers_product_bobs_table->save()) {
                    $this->errors[] = Tools::displayError('Error update BD');
                    return true;
                }
            }
        }
        Tools::clearSmartyCache();
        return true;
    }


    public function deleteStickers($arStickers)
    {
        foreach ($arStickers as $id_sticker) {
            $this->deleteSticker($id_sticker);
        }
    }


    public function deleteSticker($id_sticker = null)
    {
        if (Validate::isUnsignedInt($id_sticker)) {
            $this->deleteImageSticker($id_sticker);
            $stickers_bobs_table = new StickersBobsTable($id_sticker);
            if (!$stickers_bobs_table->delete()) {
                $this->errors[] = 'Error delete sticker DB';
            }
            if (!StickersProductsBobsTable::deleteOfSticker($id_sticker)) {
                $this->errors[] = 'Error delete sticker DB';
            }
            Tools::clearSmartyCache();
        } else {
            $this->errors[] = 'Error delete';
        }
    }


    public function deleteImageSticker($id_sticker)
    {
        $image_type_sticker = StickersBobsTable::getImageType($id_sticker);
        $path_image_old = $this->local_path . 'views/img/' . (string)$id_sticker . $image_type_sticker;
        if (file_exists($path_image_old)) {
            unlink($path_image_old); //Delete Old image
        }
    }


    public function renderOpenProduct($id_product)
    {
        $this->context->controller->addCSS($this->_path . 'views/css/admin_style.css', 'all');
        $this->context->controller->addCSS($this->_path . 'views/css/mini_stickers.css', 'all');
        $this->context->controller->addCSS($this->_path . 'views/css/stickers.css', 'all');

        $this->context->controller->addJs($this->_path . 'views/js/get_color_admin.js', 'all');
        $this->context->controller->addJs($this->_path . 'views/js/open_product_admin.js', 'all');


        $stickers = StickersBobsTable::getStickers();

        $stickers_products_id = StickersProductsBobsTable::getStickersProduct($id_product);

        $name_product = BlockStickersBobsModel::getNameProduct($id_product);

        $id_image = BlockStickersBobsModel::getIdImageProduct($id_product);

        $path_image_product = $this->getPathImage($id_image, 'home');

        $this->addCurrentUrlImgSt($stickers);

        $message = $this->addMessage();

        foreach ($stickers as $key => $sticker) {
            $stickers[$key]['class_color_corners'] = $this->getClassColor($sticker['color_background_sticker']);
            if (empty($stickers_products_id)) {
                $stickers[$key]['sticker_product_on'] = 0;
            } else {
                foreach ($stickers_products_id as $sticker_products_id) {
                    if ($sticker['id_sticker'] == $sticker_products_id['id_sticker']) {
                        $stickers[$key]['sticker_product_on'] = 1;
                        break;
                    } else {
                        $stickers[$key]['sticker_product_on'] = 0;
                    }
                }
            }
        }
        Media::addJsDef(array('arrayStickers' => $stickers));

        $this->context->smarty->assign(array(
            'stickers'           => $stickers,
            'id_product'         => $id_product,
            'name_product'       => $name_product,
            'path_image_product' => $path_image_product,
            'width_box'          => self::_WIDTH_BOX_,
            'message'            => $message,
            'current_url'        =>
                $this->normalizeURL(
                    $this->context->link->getAdminLink('AdminModules') .
                    '&configure=blockstickersbobs
                    &tab_module=front_office_features&module_name=blockstickersbobs'
                )
        ));

        return $this->display(__FILE__, 'views/templates/admin/open_product.tpl');
    }


    public function renderStickers()
    {
        $this->context->controller->addCSS($this->_path . 'views/css/mini_stickers.css', 'all');
        $this->context->controller->addCSS($this->_path . 'views/css/admin_style.css', 'all');

        $stickers = $this->getStickersParameters();

        $message = $this->addMessage();

        $this->context->smarty->assign(array(
            'stickers'    => $stickers,
            'message'     => $message,
            'current_url' => $this->normalizeURL(
                $this->context->link->getAdminLink('AdminModules') .
                '&configure=blockstickersbobs&tab_module=front_office_features&module_name=blockstickersbobs'
            )
        ));

        return $this->display(__FILE__, 'views/templates/admin/stickers.tpl');
    }


    public function renderSticker()
    {

        $this->context->controller->addCSS($this->_path . 'views/css/admin_style.css', 'all');
        $this->context->controller->addCSS($this->_path . 'views/css/stickers.css', 'all');


        if (Tools::isSubmit('id_sticker')) {    //id sticker
            $id_sticker = Tools::getValue('id_sticker');
            $sticker = new StickersBobsTable($id_sticker);
            $new_sticker = false;
        } else {
            $sticker = new StickersDefaultBobsTable(1);
            $id_sticker = StickersBobsTable::getMaxID()+1;
            $sticker->name = 'New sticker №' . $id_sticker;
            $new_sticker = true;
        }

        $image_uploader = $this->imageUploader($id_sticker, $sticker->image_type_sticker);
        $color_font_sticker_color = $this->colorModified($sticker->color_font_sticker);
        $color_background_sticker_color = $this->colorModified($sticker->color_background_sticker);

        $this->context->controller->addJs($this->_path . 'views/js/get_color_admin.js', 'all');
        $this->context->controller->addJs($this->_path . 'views/js/render_sticker_admin.js', 'all');
        $this->context->controller->addJs('js/jquery/plugins/jquery.colorpicker.js', 'all');
        $this->context->controller->addJQueryUI('ui.draggable');
        Media::addJsDef(array('width_box' => self::_WIDTH_BOX_));
        Media::addJsDef(array('type_sticker' => $sticker->type_sticker));

        /* BEGIN STICKER DEFAULT ADD */

        $stickers_default = StickersDefaultBobsTable::getStickers();

        $sticker_default_angle_right = array();
        $sticker_default_angle_left = array();
        $sticker_default_label = array();
        $sticker_default_horizontal_strip = array();
        $sticker_default_image = array();
        foreach ($stickers_default as $sticker_default) {
            if ($sticker_default['type_sticker'] == 0) {
                $sticker_default_angle_right = $sticker_default;
            }
            if ($sticker_default['type_sticker'] == 1) {
                $sticker_default_angle_left = $sticker_default;
            }
            if ($sticker_default['type_sticker'] == 2) {
                $sticker_default_label = $sticker_default;
            }
            if ($sticker_default['type_sticker'] == 3) {
                $sticker_default_horizontal_strip = $sticker_default;
            }
            if ($sticker_default['type_sticker'] == 4) {
                $sticker_default_image = $sticker_default;
            }
        }

        Media::addJsDef(array('sticker_default_angle_right' => $sticker_default_angle_right));
        Media::addJsDef(array('sticker_default_angle_left' => $sticker_default_angle_left));
        Media::addJsDef(array('sticker_default_label' => $sticker_default_label));
        Media::addJsDef(array('sticker_default_horizontal_strip' => $sticker_default_horizontal_strip));
        Media::addJsDef(array('sticker_default_image' => $sticker_default_image));

        /* END STICKER DEFAULT ADD */


        if (file_exists($this->local_path . 'views/img/' . $sticker->id_sticker . $sticker->image_type_sticker)) {
            $current_url_img = $this->_path . 'views/img/' . $sticker->id_sticker . $sticker->image_type_sticker;
        } else {
            $current_url_img = $this::URL_DEFAULT_IMG;
        }


        $redirect = 'stickers';
        $id_product_for_return = '';
        if (Tools::getIsset('previous') && Tools::getValue('previous') === 'openproduct') {
            if (Tools::getIsset('id_product')) {
                $redirect = 'openproduct';
                $id_product_for_return = '&previous=openproduct&id_product=' . Tools::getValue('id_product');
            }
        }

        $message = $this->addMessage();

        $this->context->smarty->assign(array(
            'image_uploader'                   => $image_uploader,
            'sticker'                          => $sticker,
            'sticker_default_angle_right'      => $sticker_default_angle_right,
            'sticker_default_angle_left'       => $sticker_default_angle_left,
            'sticker_default_label'            => $sticker_default_label,
            'sticker_default_horizontal_strip' => $sticker_default_horizontal_strip,
            'sticker_default_image'            => $sticker_default_image,
            'message'                          => $message,
            'width_box'                        => self::_WIDTH_BOX_,
            'color_font_sticker_color'         => $color_font_sticker_color,
            'color_background_sticker_color'   => $color_background_sticker_color,
            'current_url_img'                  => $current_url_img,
            'current_url_default_img'          => $this::URL_DEFAULT_IMG,
            'new_sticker'                      => $new_sticker,
            'current_url'                      => $this->normalizeURL(
                $this->context->link->getAdminLink('AdminModules') . '&' .
                'configure=blockstickersbobs&
                tab_module=front_office_features&
                module_name=blockstickersbobs' .
                $id_product_for_return
            ),
            'redirect'                         => $redirect
        ));

        return $this->display(__FILE__, 'views/templates/admin/sticker.tpl');
    }


    /**
     * Create image for renderSticker
     *
     * @param $id_sticker
     * @param $image_type_sticker
     *
     * @return array
     */
    private function imageUploader($id_sticker, $image_type_sticker)
    {
        //We take out an image file and pass it to the processing that is output on the screen
        $image_uploader = array();
        if (file_exists(
            $this->local_path . 'views/img/' . (int)$id_sticker . $image_type_sticker
        )) {
            $image_dir=$this->local_path . 'views/img/' . (int)$id_sticker . $image_type_sticker;
            $image_old_dir=$this->context->controller->table . '_' . (int)$id_sticker . '_temp' . $image_type_sticker;
            $image_uploader['exist'] = 1;
            $image_uploader['image_url'] = $this->imageGenerate($image_dir, $image_old_dir, 1000, $image_type_sticker);
        } else {
            $image_uploader['exist'] = 0;
        }

        return $image_uploader;
    }


    /**
     * Changes the size and creates a temporary image
     *
     * @param  dir   $image
     * @param  dir   $cache_image
     * @param int    $size
     * @param string $image_type
     *
     * @return string
     * @author  Bobs
     */
    private function imageGenerate($image, $cache_image, $size, $image_type = 'jpg')
    {
        if (!file_exists($image)) {
            return '';
        }
        if (file_exists(_PS_TMP_IMG_DIR_ . $cache_image)) {
            @unlink(_PS_TMP_IMG_DIR_ . $cache_image);
        }

        $infos = getimagesize($image);
        // Evaluate the memory required to resize the image: if it's too much, you can't resize it.
        if (!ImageManager::checkImageMemoryLimit($image)) {
            return false;
        }
        $x = $infos[0];
        $y = $infos[1];
        $max_x = $size * 3;

        // Size is already ok
        if ($y < $size && $x <= $max_x) {
            copy($image, _PS_TMP_IMG_DIR_ . $cache_image);
        } else {
            $ratio_x = $x / ($y / $size);
            if ($ratio_x > $max_x) {
                $ratio_x = $max_x;
                $size = $y / ($x / $max_x);
            }
            ImageManager::resize($image, _PS_TMP_IMG_DIR_ . $cache_image, $ratio_x, $size, $image_type);
        }
        // Relative link will always work, whatever the base uri set in the admin
        if (Context::getContext()->controller->controller_type == 'admin') {
            return '../img/tmp/' . $cache_image . '?time=' . time();
        } else {
            return _PS_TMP_IMG_ . $cache_image . '?time=' . time();
        }
    }


    private function colorExpandList($color)
    {
        if ($color[0] == '#') {
            $color = Tools::substr($color, 1);
        }
        if (Tools::strlen($color) == 6) {
            list($red, $green, $blue) = array(
                $color[0] . $color[1],
                $color[2] . $color[3],
                $color[4] . $color[5]
            );
        } elseif (Tools::strlen($color) == 3) {
            list($red, $green, $blue) = array(
                $color[0] . $color[0],
                $color[1] . $color[1],
                $color[2] . $color[2]
            );
        } else {
            return false;
        }
        $red = hexdec($red);
        $green = hexdec($green);
        $blue = hexdec($blue);


        return array('red' => $red, 'green' => $green, 'blue' => $blue);
    }


    /**
     * Returns black? if color light and white? if dark
     *
     * @param $color
     *
     * @return string
     * @author  Bobs
     */
    private function colorModified($color)
    {
        $array_color = $this->colorExpandList($color);
        $red = $array_color['red'];
        $green = $array_color['green'];
        $blue = $array_color['blue'];

        $light = ($red * 0.8 + $green + $blue * 0.2) / 510 * 100;
        if ($light > 50) {
            return '#000000';
        } else {
            return '#FFFFFF';
        }
    }



    public function renderEntry()
    {
        $this->context->controller->addCSS($this->_path . 'views/css/mini_stickers.css', 'all');
        $this->context->controller->addCSS($this->_path . 'views/css/admin_style.css', 'all');

        $this->context->controller->addJs($this->_path . 'views/js/entry_admin.js', 'all');

        // select products
        $filter_name = Tools::getValue('filter_name');
        $filter_order = Tools::getValue('filter_order');
        $filter_data = null;
        if ($filter_name && $filter_order) {
        } else {
            $filter_name = 'id_product';
            $filter_order = 'asc';
        }
        $filter_data = array('filter_name' => $filter_name, 'filter_order' => $filter_order);

        $find_data = null;
        if (Tools::getIsset('find_data') && !Tools::getIsset('submitResetProductblockstickersbobs')) {
            $find_data = Tools::getValue('find_data');
            foreach ($find_data as $key => $find_data_value) {
                if ($find_data_value == "") {
                    unset($find_data[$key]);
                }
            }
        }
        if (Tools::getIsset('submitResetProductBlockstickersbobs')) {
            $find_data = null;
        }
        $products = $this->getProductsData($filter_data, $find_data, (int)Tools::getValue('id_category'));
        if (count($products) > 1000 && !Tools::getIsset('open_category')) {
            $products = null;
        }

        $stickers_view_parameters = $this->getStickersParameters();

        $message = $this->addMessage();

        $this->context->smarty->assign(array(
            'stickers_view_parameters' => $stickers_view_parameters,
            'products'            => $products,
            'message'             => $message,
            'current_url'         => $this->normalizeURL($this->context->link->getAdminLink('AdminModules') .
                                                         '&configure=blockstickersbobs&tab_module=front_office_features&
                                     module_name=blockstickersbobs'),
            'find_data'           => $find_data,
            'filter_name'         => mb_strtolower($filter_name),
            'filter_order'        => mb_strtolower($filter_order),
            'id_category'         => Tools::getValue('id_category'),
            'categoriesTree'      => Category::getRootCategory()->recurseLiteCategTree(0),
            'subcategory_dir'         => $this->local_path . 'views/templates/admin/category-tree-branch.tpl'
        ));

        return $this->display(__FILE__, 'views/templates/admin/entry.tpl');
    }



    private function getProductsData($filter_data, $find_data, $id_category = null)
    {
        $products = BlockStickersBobsModel::getProductsData(
            $this->context->language->id,
            $filter_data,
            $find_data,
            $id_category
        );

        $stickers_product_id = StickersProductsBobsTable::getStickersProducts();

        foreach ($products as $key => $product) {
            //IMAGE PRODUCT
            $products[$key]['image_dir'] = $this->getPathImage($product['id_image'], 'cart');

            //STICKERS
            $products[$key]['stickers'] = array();
            foreach ($stickers_product_id as $sticker_product_id) {
                if ($product['id_product'] == $sticker_product_id['id_product']) {
                    $products[$key]['stickers'][] = $sticker_product_id['id_sticker'];
                }
            }
        }
        return $products;
    }


    private function getStickersParameters()
    {
        $stickers_view_parameters = StickersBobsTable::getStickers();
        $this->addCurrentUrlImgSt($stickers_view_parameters);
        $this->normalizeSVP($stickers_view_parameters);
        return $stickers_view_parameters;
    }


    /**
     * Update array('10'=> array('id_sticker' => 10 ...))
     * @param $stickers_view_parameters
     */
    private function normalizeSVP(&$stickers_view_parameters)
    {
        $SVP = array();
        foreach ($stickers_view_parameters as $sticker_view_parameters) {
            $SVP[$sticker_view_parameters['id_sticker']] = $sticker_view_parameters;
        }
        $stickers_view_parameters = $SVP;
    }


    /**
     * Get image path product
     *
     * @param        $id_image
     * @param string $type_size
     *
     * @return string
     */
    private function getPathImage($id_image, $type_size = 'cart')
    {
        return
            _THEME_PROD_DIR_ .
            '/' .
            chunk_split($id_image, 1, '/') .
            $id_image .
            '-' .
            ImageType::getFormatedName($type_size) .
            '.jpg';
    }


    private function normalizeURL($url)
    {
        $url =str_replace(array("\r", "\n", " "), '', $url);
        return $url;
    }


    private function addMessage()
    {
        $message = '';
        if (isset($this->errors)) {
            foreach ($this->errors as $error) {
                $message = $message . $this->displayError($this->l($error));
            }
        }
        return $message;
    }

    private function getClassColor($color)
    {

        $array_color = $this->colorExpandList($color);
        $red = $array_color['red'];
        $green = $array_color['green'];
        $blue = $array_color['blue'];

        $class_color = '';

        $half_color = 128;
        $whole_color = 190;

        $check_red = 0; //0-<128 128<x<190 190<x
        $check_green = 0;
        $check_blue = 0;

        if ($red < $half_color) {
            $check_red = 0;
        }
        if ($half_color < $red && $red< $whole_color) {
            $check_red = 1;
        }
        if ($whole_color < $red) {
            $check_red = 2;
        }

        if ($green < $half_color) {
            $check_green = 0;
        }
        if ($half_color < $green && $green < $whole_color) {
            $check_green = 1;
        }
        if ($whole_color < $green) {
            $check_green = 2;
        }

        if ($blue < $half_color) {
            $check_blue = 0;
        }
        if ($half_color < $blue && $blue < $whole_color) {
            $check_blue = 1;
        }
        if ($whole_color < $blue) {
            $check_blue = 2;
        }


        if ($check_red == 0) { //0
            if ($check_green == 0) { //0 0
                if ($check_blue == 0) {
                    $class_color = 'black'; //0 0 0
                }
                if ($check_blue == 1) {
                    $class_color = 'saturated_blue'; //0 0 170
                }
                if ($check_blue == 2) {
                    $class_color = 'super_blue'; //0 0 240
                }
            }
            if ($check_green == 1) { //0 170
                if ($check_blue == 0) {
                    $class_color = 'green'; //0 170 0
                }
                if ($check_blue == 1) {
                    $class_color = 'lada'; //0 170 170
                }
                if ($check_blue == 2) {
                    $class_color = 'blue'; //0 170 240
                }
            }
            if ($check_green == 2) { //0 240
                if ($check_blue == 0) {
                    $class_color = 'saturated_green'; //0 240 0
                }
                if ($check_blue == 1) {
                    $class_color = 'easy_green'; //0 240 170
                }
                if ($check_blue == 2) {
                    $class_color = 'saturated_ocean';  //0 240 240
                }
            }
        }


        if ($check_red == 1) { //170
            if ($check_green == 0) { //170 0
                if ($check_blue == 0) {
                    $class_color = 'saturated_red'; //170 0 0
                }
                if ($check_blue == 1) {
                    $class_color = 'gray_blue'; //170 0 170
                }
                if ($check_blue == 2) {
                    $class_color = 'purple_blue'; //170 0 240
                }
            }
            if ($check_green == 1) { //170 170
                if ($check_blue == 0) {
                    $class_color = 'saturated_olive'; //170 170 0
                }
                if ($check_blue == 1) {
                    $class_color = 'gray'; //170 170 170
                }
                if ($check_blue == 2) {
                    $class_color = 'ocean'; //170 170 240
                }
            }
            if ($check_green == 2) { //170 240
                if ($check_blue == 0) {
                    $class_color = 'easy_olive'; //170 240 0
                }
                if ($check_blue == 1) {
                    $class_color = 'olive'; //170 240 170
                }
                if ($check_blue == 2) {
                    $class_color = 'plastic';  //170 240 240
                }
            }
        }

        if ($check_red == 2) { //240
            if ($check_green == 0) { //240 0
                if ($check_blue == 0) {
                    $class_color = 'red'; //240 0 0
                }
                if ($check_blue == 1) {
                    $class_color = 'purple_red'; //240 0 170
                }
                if ($check_blue == 2) {
                    $class_color = 'saturated_purple'; //240 0 240
                }
            }
            if ($check_green == 1) { //240 170
                if ($check_blue == 0) {
                    $class_color = 'brown'; //240 170 0
                }
                if ($check_blue == 1) {
                    $class_color = 'pink'; //240 170 170
                }
                if ($check_blue == 2) {
                    $class_color = 'purple'; //240 170 240
                }
            }
            if ($check_green == 2) { //240 240
                if ($check_blue == 0) {
                    $class_color = 'easy_brown'; //240 240 0
                }
                if ($check_blue == 1) {
                    $class_color = 'flesh'; //240 240 170
                }
                if ($check_blue == 2) {
                    $class_color = 'easy_gray';  //240 240 240
                }
            }
        }
        //$('[name = text_sticker]').val('$check_red ' +
        //$check_red + ' $check_green ' + $check_green +' $check_blue  ' + $check_blue);
        //angle_right_sticker.text($class_color);
        //angle_left_sticker.text($class_color);
        return $class_color;
    }
}
