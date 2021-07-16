// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//TempInventory

package {
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class TempInventory extends MovieClip {

        public var strGold:TextField;
        public var mcItemList:ItemList;
        public var txtEquip:TextField;
        public var strInfo:TextField;
        public var btnEquip:SimpleButton;
        public var bg1:MovieClip;
        public var strCoins:TextField;
        var rootClass:MovieClip;

        public function TempInventory(){
            rootClass = MovieClip(parent.parent.parent);
            super();
            bg1.btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            btnEquip.addEventListener(MouseEvent.CLICK, onEquipClick, false, 0, true);
            txtEquip.mouseEnabled = false;
            init();
        }

        public function onDeleteClick(_arg1:Event):void{
        }

        public function onEquipClick(_arg1:Event){
            rootClass.mixer.playSound("Click");
            var _local2:* = rootClass.world.getUoLeafById(rootClass.world.myAvatar.uid);
            if (_local2.intState != 1){
                rootClass.MsgBox.notify("Action cannot be performed during combat!");
            }
            else {
                if (mcItemList.selectedItem.bEquip == 1){
                    if ((((mcItemList.selectedItem.sES == "Weapon")) || ((mcItemList.selectedItem.sES == "ar")))){
                        rootClass.MsgBox.notify("Selected Item cannot be unequipped!");
                    }
                    else {
                        rootClass.world.sendUnequipItemRequest(mcItemList.selectedItem);
                    };
                }
                else {
                    if ((((mcItemList.selectedItem.bUpg == 1)) && (!(rootClass.world.myAvatar.isUpgraded())))){
                        rootClass.showUpgradeWindow();
                    }
                    else {
                        if (int(mcItemList.selectedItem.iEnhLvl) > int(rootClass.world.myAvatar.objData.intLevel)){
                            rootClass.MsgBox.notify("Level requirement not met!");
                        }
                        else {
							/*
                            if (((!((mcItemList.selectedItem.sES == "co"))) && (!((mcItemList.selectedItem.RefineID > 0))))){
                                rootClass.MsgBox.notify("Selected item requires refinement!");
                            }
							else {
							*/
                            
                                rootClass.world.sendEquipItemRequest(mcItemList.selectedItem);
                            };
                        //};
                    };
                };
            };
        }

        function onCloseClick(_arg1:Event){
            MovieClip(parent).onClose();
        }

        public function toggleInventory():void{
            this.visible = !(this.visible);
        }

        public function refreshDetail():void{
            if (selectedItem == null){
                strInfo.htmlText = "Please select an item to view details.";
                btnEquip.visible = (txtEquip.visible = false);
            }
            else {
                if (selectedItem.bEquip == 1){
                    txtEquip.text = "Unequip";
                }
                else {
                    txtEquip.text = "Equip";
                };
                btnEquip.visible = (txtEquip.visible = (selectedItem.sES == "co"));
                strInfo.htmlText = getItemInfoString(selectedItem);
            };
        }

        public function get selectedItem():Object{
            return (mcItemList.selectedItem);
        }

        public function init():void{
            mcItemList.init(MovieClip(parent.parent.parent).world.myAvatar.tempitems);
            updateGold();
            refreshDetail();
        }

        public function updateGold():void{
            strGold.text = MovieClip(parent.parent.parent).world.myAvatar.objData.intGold;
            strCoins.text = MovieClip(parent.parent.parent).world.myAvatar.objData.intCoins;
        }

        function getItemInfoString(_arg1:Object):String{
            var _local4:Number;
            var _local2:* = (("<font size='14'><b>" + _arg1.sName) + "</b></font><br>");
            var _local3:* = "#009900";
            _local2 = (_local2 + ((("<font color='" + _local3) + "'><b>") + _arg1.sType));
            if (_arg1.sES == "Weapon"){
                if (_arg1.iEnh > 0){
                    _local2 = (_local2 + ((", Lvl " + _arg1.iLvl) + "<br>"));
                    _local4 = (((Math.sqrt(_arg1.iLvl) * 20) * _arg1.iDPS) / 100);
                    _local2 = (_local2 + ((((Math.ceil(((_local4 * (100 - Number(_arg1.iRng))) / 100)) + " - ") + Math.ceil(((_local4 * (100 + Number(_arg1.iRng))) / 100))) + " ") + _arg1.sElmt));
                }
                else {
                    _local2 = (_local2 + " Design");
                };
            };
            _local2 = (_local2 + (("</b></font><br>" + _arg1.sDesc) + "<br>"));
            return (_local2);
        }


    }
}//package 

