// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//interfaceMenu

package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;

    public class interfaceMenu extends MovieClip {

        public var mcMenu:MovieClip;
        private var currentPos:Number;
        private var h:Number = 25.2;
        private var w:Number = 118.25;
        public var btnOpen:String = "";
        private var rootClass:MovieClip;

        public function interfaceMenu(_arg1:Array, _arg2:String, _arg3:MovieClip){
            var _local4:MovieClip;
            var _local5:uint;
            super();
            btnOpen = _arg2;
            rootClass = _arg3;
            mcMenu = new MovieClip();
            _local4 = (new menuBottom() as MovieClip);
            _local4.height = (_local4.height - 1);
            _local4.width = (_local4.width - 1);
            _local4.x = (_local4.x - 43);
            _local4.y = (_local4.y - 10.7);
            currentPos = (_local4.y - 2);
            mcMenu.addChild(_local4);
            _local4 = (new menuListItem() as MovieClip);
            _local4.x = (_local4.x + 17);
            _local4.height = h;
            _local4.width = w;
            _local4.mTxt.text = _arg1[0].txt;
            _local4.y = ((currentPos - (h >> 1)) + 1);
            _local4.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            _local4.buttonMode = true;
            _local4.mouseChildren = false;
            _local4.name = _arg1[0].fct;
            currentPos = _local4.y;
            mcMenu.addChild(_local4);
            _local5 = 1;
            while (_local5 < (_arg1.length - 1)) {
                _local4 = (new menuListItem() as MovieClip);
                _local4.x = (_local4.x + 17);
                _local4.height = h;
                _local4.width = w;
                _local4.y = ((currentPos - h) + 1);
                currentPos = _local4.y;
                _local4.mTxt.text = _arg1[_local5].txt;
                _local4.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
                _local4.buttonMode = true;
                _local4.mouseChildren = false;
                _local4.name = _arg1[_local5].fct;
                mcMenu.addChild(_local4);
                _local5++;
            };
            _local4 = (new menuTop() as MovieClip);
            _local4.height--;
            _local4.width--;
            _local4.y = (currentPos - _local4.height);
            _local4.txt.text = _arg1[(_arg1.length - 1)].txt;
            _local4.x = (_local4.x + 17);
            mcMenu.addChild(_local4);
        }

        private function onClick(_arg1:MouseEvent):void{
            var _local3:Function;
            var _local2:Array = _arg1.currentTarget.name.split(".");
            switch (_local2.length){
                case 1:
                    _local3 = this[_arg1.currentTarget.name];
                    break;
                case 2:
                    _local3 = rootClass[_local2[1]];
                    break;
                case 3:
                    _local3 = rootClass.world[_local2[2]];
                    break;
            };
            (_local3());
        }

        private function charPage():void{
            var _local1:String = rootClass.world.myAvatar.objData.strUsername;
            if (rootClass.params.strSourceID == "BBGames"){
                navigateToURL(new URLRequest(("http://leviathanworlds.fun/?profile=" + _local1)), "_blank");
            }
            else {
                navigateToURL(new URLRequest(("http://leviathanworlds.fun/?profile=" + _local1)), "_blank");
            };
        }

        private function toggleTempInventory():void{
            if (!rootClass.world.uiLock){
                if (rootClass.ui.mcPopup.currentLabel == "Temp"){
                    rootClass.ui.mcPopup.onClose();
                }
                else {
                    rootClass.ui.mcPopup.fOpen("Temp");
                };
            };
        }

        private function toggleInventory():void{
            if (!rootClass.world.uiLock){
                if (rootClass.ui.mcPopup.currentLabel == "Inventory"){
                    MovieClip(rootClass.ui.mcPopup.getChildByName("mcInventory")).fClose();
                }
                else {
                    rootClass.ui.mcPopup.fOpen("Inventory");
                };
            };
        }


    }
}//package 

