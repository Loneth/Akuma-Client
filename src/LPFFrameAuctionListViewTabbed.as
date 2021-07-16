// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFFrameListViewTabbed

package {
    import flash.text.TextField;
    import flash.display.MovieClip;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.display.Graphics;
    import flash.text.*;

    public class LPFFrameAuctionListViewTabbed extends LPFFrame {

        public var Param1:TextField;
        public var tMsg:TextField;
        public var listMask:MovieClip;
        public var bgTabs:MovieClip;
        public var bgList:MovieClip;
        public var tabs:MovieClip;
        public var iList:MovieClip;
        public var scr:LPFElementScrollBar;
        private var listA:Array;
        private var aSel:Array;
        private var iSel:Object;
        public var tSel:Object;
        private var tabStates:Array;
        private var filterMap:Object;
        private var itemEventType:String;
        private var tabEventType:String;
        private var sortOrder:Array;
        private var filter:String = "";
        private var allowDesel:Boolean = false;
        private var onDemand:Boolean = false;
        public var onSearch:Boolean = false;
        private var openBlank:Boolean = false;
        private var refreshTabs:Boolean = false;
        private var bLimited:Boolean = false;

        public function LPFFrameAuctionListViewTabbed():void{
            listA = [];
            aSel = [];
            tabStates = [];
            filterMap = {};
            sortOrder = [];
            super();
            x = 0;
            y = 0;
            fData = {};
            
        }
		

        override public function fOpen(_arg1:Object):void{
            fData = _arg1.fData;
            positionBy(_arg1.r);
            drawBG();
            if (("tabStates" in _arg1)){
                tabStates = _arg1.tabStates;
            };
            if (("filterMap" in _arg1)){
                filterMap = _arg1.filterMap;
            };
            if (("sortOrder" in _arg1)){
                sortOrder = _arg1.sortOrder;
            };
            if (("eventTypes" in _arg1)){
                eventTypes = _arg1.eventTypes;
            };
            if (("filter" in _arg1)){
                filter = _arg1.filter;
            };
            if (("itemEventType" in _arg1)){
                itemEventType = _arg1.itemEventType;
            };
            if (("tabEventType" in _arg1)){
                tabEventType = _arg1.tabEventType;
            };
            if (("sName" in _arg1)){
                sName = _arg1.sName;
            };
            if (("allowDesel" in _arg1)){
                allowDesel = (_arg1.allowDesel == true);
            };
            if (("openBlank" in _arg1)){
                openBlank = (_arg1.openBlank == true);
            };
            if (("onDemand" in _arg1)){
                onDemand = (_arg1.onDemand == true);
            };
            if (("refreshTabs" in _arg1)){
                refreshTabs = (_arg1.refreshTabs == true);
            };
            if (("bLimited" in fData)){
                bLimited = (_arg1.fData.bLimited == true);
            };
            if (!openBlank){
                if (iSel == null){
                    tSel = getTabByFilter("*");
                }
                else {
                    tSel = getTabByFilter(iSel.sType);
                };
            };
            initTabs();
            fDraw();
            getLayout().registerForEvents(this, eventTypes);
			getLayout().rootClass.auctionTabs = this;
        }

        public function fRefresh(_arg1:Object):void{
            if (("tabStates" in _arg1)){
                tabStates = _arg1.tabStates;
            };
            if (("filterMap" in _arg1)){
                filterMap = _arg1.filterMap;
            };
            if (("sortOrder" in _arg1)){
                sortOrder = _arg1.sortOrder;
            };
            if (("eventTypes" in _arg1)){
                eventTypes = _arg1.eventTypes;
            };
            if (("filter" in _arg1)){
                filter = _arg1.filter;
            };
            if (("itemEventType" in _arg1)){
                itemEventType = _arg1.itemEventType;
            };
            if (("tabEventType" in _arg1)){
                tabEventType = _arg1.tabEventType;
            };
            if (("sName" in _arg1)){
                sName = _arg1.sName;
            };
            iSel = null;
            tSel = getTabByFilter("*");
            initTabs();
            fDraw();
        }

        private function initTabs():void{
            var _local6:MovieClip;
            var _local7:Object;
            var _local8:DisplayObject;
            var _local9:String;
            var _local1:int;
            var _local2:int;
            var _local3:Object = {};
            var _local4:Array = [];
            var _local5 = "";
            while (tabs.numChildren > 0) {
                tabs.removeChildAt(0);
            };
            bgTabs.graphics.clear();
            _local2 = 0;
            while (_local2 < tabStates.length) {
                if (onDemand && !onSearch){
                    tabStates[_local2].state = 0;
                }
                else {
                    tabStates[_local2].state = -1;
                    for each (_local3 in fData.list) {
                        for (_local9 in filterMap) {
                            if (filterMap[_local9].indexOf(_local3.sType) > -1){
                                if (tabStates[_local2].filter == _local9){
                                    tabStates[_local2].state = 0;
                                };
                            };
                        };
                    };
                };
                _local2++;
            };
            _local4 = [];
            _local1 = 0;
            while (_local1 < tabStates.length) {
                _local3 = tabStates[_local1];
                _local6 = (tabs.addChild(new LPFElementListViewTab()) as MovieClip);
                _local7 = getLayout().rootClass.world.getClass(_local3.icon);
                _local8 = _local6.icon.addChild(new (_local7)());
                _local8.scaleX = (_local8.scaleY = (16 / _local8.height));
                _local8.x = (_local8.x - (_local8.width / 2));
                _local8.y = 2;
                _local6.icon.mouseEnabled = false;
                _local6.icon.mouseChildren = false;
                _local6.o = _local3;
                _local3.mc = _local6;
                _local6.bg2.visible = false;
                if (_local3 == tSel){
                    _local3.state = 1;
                };
                if (_local3.state == -1){
                    _local6.icon.alpha = 0.3;
                    _local6.bg3.visible = true;
                    _local6.bg2.visible = false;
                    _local6.bg.visible = false;
                    _local6.mouseEnabled = false;
                    _local6.mouseChildren = false;
                }
                else {
                    _local6.bg3.visible = false;
                    _local6.buttonMode = true;
                    if (_local3.state == 1){
                        _local6.bg.visible = false;
                        _local6.bg2.visible = true;
                    };
                    _local6.addEventListener(MouseEvent.MOUSE_DOWN, tabClick, false, 0, true);
                };
                _local6.x = (int(((_local6.width + 3) * _local1)) + 1);
                _local4.push(_local6.getBounds(this.bgTabs));
                _local1++;
            };
            drawTabBG();
        }

        private function fDraw(_arg1:Boolean=true):void{
            var _local8:String;
            var _local10:LPFElementAuctionListItemItem;
            var _local12:DisplayObject;
            var _local13:DisplayObject;
            listA = [];
            var _local2:Array = [];
            var _local3:Array = [];
            var _local4:Array = [];
            var _local5:Array = [];
            var _local6:int;
            var _local7:int;
            var _local9:Object = {};
            while (iList.numChildren > 0) {
                LPFElementAuctionListItemItem(iList.getChildAt(0)).fClose();
            };
            if (_arg1){
                iList.y = (bgTabs.height - 1);
            };
            if (tSel == null){
                setMessage("Select a category tab to start browsing auctions.");
                scr.fOpen({
                    subject:iList,
                    subjectMask:listMask,
                    reset:_arg1
                });
                return;
            };
            setMessage("");
            if (tSel.filter != "*"){
                for each (_local9 in fData.list) {
                    if (filterMap[tSel.filter].indexOf(_local9.sType) > -1){
                        _local5.push(_local9);
                    };
                };
            }
            else {
                _local5 = fData.list;
            };
			
			
            if (((onDemand && !onSearch) && ((_local5.length == 0)))){
                setMessage("No items of this type");
                scr.fOpen({
                    subject:iList,
                    subjectMask:listMask,
                    reset:_arg1
                });
                return;
            };
            _local6 = 0;
            while (_local6 < sortOrder.length) {
                _local2 = [];
                for each (_local9 in _local5) {
                    if (_local9.sType == sortOrder[_local6]){
                        _local2.push(_local9);
                    };
                };
                if (_local2.length > 0){
                    _local2.sortOn(["sName", "iLvl"], [undefined, (Array.DESCENDING | Array.NUMERIC)]);
                    listA = listA.concat(_local2);
                };
                _local6++;
            };
            _local2 = [];
            for each (_local9 in _local5) {
                if (listA.indexOf(_local9) == -1){
                    _local2.push(_local9);
                };
            };
            if (_local2.length > 0){
                _local2.sortOn(["sType", "sName"]);
                listA = listA.concat(_local2);
            };
            var _local11:Object = {};
            _local11.eventType = itemEventType;
            _local11.allowDesel = allowDesel;
            _local11.bLimited = ((bLimited) && ((getLayout().sMode == "shopBuy")));
            _local6 = 0;
            while (_local6 < listA.length) {
                _local11.fData = listA[_local6];
                _local10 = new LPFElementAuctionListItemItem();
                _local12 = iList.addChild(_local10);
                _local10.subscribeTo(this);
                _local10.fOpen(_local11);
                if (_local10.fData == iSel){
                    _local10.select();
                };
                if (_local6 > 0){
                    _local13 = iList.getChildAt((_local6 - 1));
                    _local12.y = (_local13.y + _local13.height);
                };
                _local6++;
            };
            scr.fOpen({
                subject:iList,
                subjectMask:listMask,
                reset:_arg1
            });
        }

        public function getTabByFilter(_arg1:String):Object{
            var _local2:Object;
            var _local3:int;
            while (_local3 < tabStates.length) {
                _local2 = tabStates[_local3];
                if (_local2.filter == _arg1){
                    return (_local2);
                };
                _local3++;
            };
            if ((((tabStates.length > 0)) && (!((_arg1 == "none"))))){
                return (tabStates[0]);
            };
            return (null);
        }
		
        public function forceTabClick(_arg1:Object):void{
            var _local3:Object;
            var _local2:Object = _arg1
            if (tSel != null){
                tSel.mc.bg.visible = true;
                tSel.mc.bg2.visible = false;
                tSel.state = 0;
            };
            tSel = _local2;
            tSel.mc.bg.visible = false;
            tSel.mc.bg2.visible = true;
            tSel.state = 1;
            drawTabBG();
                _local3 = {
                    fData:{types:filterMap[tSel.filter]},
                    eventType:tabEventType,
                    fCaller:sName
                };
                while (iList.numChildren > 0) {
                    LPFElementAuctionListItemItem(iList.getChildAt(0)).fClose();
                };
                iList.y = (bgTabs.height - 1);
                update(_local3);
        }
		
        private function tabClick(_arg1:MouseEvent):void{
            var _local3:Object;
            var _local2:Object = MovieClip(_arg1.currentTarget).o;
            if (tSel != null){
                tSel.mc.bg.visible = true;
                tSel.mc.bg2.visible = false;
                tSel.state = 0;
            };
            tSel = _local2;
            tSel.mc.bg.visible = false;
            tSel.mc.bg2.visible = true;
            tSel.state = 1;
            drawTabBG();
            if (onDemand && !onSearch){
                _local3 = {
                    fData:{types:filterMap[tSel.filter]},
                    eventType:tabEventType,
                    fCaller:sName
                };
                while (iList.numChildren > 0) {
                    LPFElementAuctionListItemItem(iList.getChildAt(0)).fClose();
                };
                iList.y = (bgTabs.height - 1);
                update(_local3);
            }
            else {
                fDraw();
            };
        }

        private function drawTabBG():void{
            var _local1:Rectangle;
            var _local2:Rectangle;
            var _local5:MovieClip;
            var _local3:Graphics = bgTabs.graphics;
            var _local4:int = (bgTabs.bg.height - 1);
            _local3.clear();
            _local3.lineStyle(0, 0x666666, 1);
            _local3.moveTo(0, _local4);
            if (tSel != null){
                _local5 = tSel.mc;
                if (_local5.x > 1){
                    _local3.lineTo(tSel.mc.x, _local4);
                };
                _local3.moveTo((tSel.mc.x + tSel.mc.width), _local4);
                _local3.lineTo(bgList.width, _local4);
                bgTabs.bg.x = (tSel.mc.x - 1);
                bgTabs.bg.visible = true;
            }
            else {
                _local3.lineTo(bgList.width, _local4);
                bgTabs.bg.visible = false;
            };
        }

        private function setMessage(_arg1:String):void{
            if (((!((_arg1 == null))) && ((_arg1.length > 0)))){
                tMsg.text = _arg1;
                tMsg.visible = true;
            }
            else {
                tMsg.text = "";
                tMsg.visible = false;
            };
        }

        override public function update(_arg1:Object):void{
            if (_arg1.eventType == itemEventType){
                iSel = _arg1.fData;
            };
            if (_arg1.eventType == tabEventType){
                iSel = null;
            };
            getLayout().update(_arg1);
        }

        override public function notify(_arg1:Object):void{
            if (_arg1.eventType == "sModeSet"){
                fData = _arg1.fData;
                fRefresh(_arg1);
            };
            if (_arg1.eventType == "refreshItems"){				
                iSel = null;
                fDraw();
                initTabs();
            };
            if (_arg1.eventType == "refreshBank"){
			    iSel = null;
                fDraw(false);
            };
            if (_arg1.eventType == "listItemASel"){
                fRefresh(_arg1);
                if (filter != ""){
                    shadeListByTypeFilter(_arg1.fData);
                };
            };
            if ((((_arg1.eventType == tabEventType)) && (!((_arg1.fData == null))))){
                if (("loadPending" in _arg1.fData)){
                    if (("msg" in _arg1.fData)){
                        setMessage(_arg1.fData.msg);
                    };
                };
            };
        }

        private function shadeListByTypeFilter(_arg1:Object):void{
            var _local2:MovieClip;
            var _local3:Object;
            var _local4:int;
            if (_arg1.eSel != null){
                _local3 = _arg1.eSel;
            };
            if (_arg1.iSel != null){
                _local3 = _arg1.iSel;
            };
            if (_local3 != null){
                _local4 = 0;
                while (_local4 < iList.numChildren) {
                    _local2 = (iList.getChildAt(_local4) as MovieClip);
                    if ((((_local2.fData[filter] == _local3[filter])) && (!((_local2.fData.sType == _local3.sType))))){
                        _local2.alpha = 1;
                        _local2.mouseEnabled = true;
                        _local2.mouseChildren = true;
                    }
                    else {
                        _local2.alpha = 0.3;
                        _local2.mouseEnabled = false;
                        _local2.mouseChildren = false;
                    };
                    _local4++;
                };
            };
        }

        public function getListItemByiSel():MovieClip{
            var _local2:MovieClip;
            var _local1:int;
            _local1 = 0;
            while (_local1 < iList.numChildren) {
                _local2 = MovieClip(iList.getChildAt(_local1));
                if (_local2.fData == iSel){
                    return (_local2);
                };
                _local1++;
            };
            return (null);
        }

        private function drawBG():void{
            bgList.width = w;
            bgList.height = ((h - listMask.y) + 3);
            bgList.y = listMask.y;
            listMask.width = w;
            listMask.height = ((h - listMask.y) - 0);
            scr.b.height = ((listMask.height - (2 * scr.a2.height)) + 1);
            scr.hit.height = scr.b.height;
            scr.hit.alpha = 0;
            scr.a2.y = ((scr.b.y + scr.b.height) + scr.a2.height);
            scr.x = (w + 2);
            tMsg.x = Math.round(((bgList.width / 2) - (tMsg.width / 2)));
            tMsg.y = Math.round((bgList.y + ((bgList.height / 2) - (tMsg.height / 2))));
        }


    }
}//package 

