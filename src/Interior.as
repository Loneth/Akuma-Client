// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Interior

package {
    import flash.display.MovieClip;
    import flash.geom.Point;
    import flash.events.MouseEvent;

    public class Interior {

        private var totalItems:int = 0;
        private var itemIDs:Array;
        private var rootClass:MovieClip;
        private var frames:Object;
        private var guildRoot:MovieClip;
        private var Loaders:Object;
        private var placeNow:Boolean = false;

        public function Interior(_arg1:String, _arg2:MovieClip, _arg3:MovieClip){
            var itemTokens:Array;
            var itemDetail:Array;
            var inter:String = _arg1;
            var r:MovieClip = _arg2;
            var gr:MovieClip = _arg3;
            this.itemIDs = new Array();
            this.frames = new Object();
            this.Loaders = new Object();
            super();
            trace("create interior");
            trace(inter);
            this.rootClass = r;
            this.guildRoot = gr;
            try {
                itemTokens = inter.split(":");
            }
            catch(e) {
                itemTokens = "".split(":");
            };
            trace(("itemTokens: " + itemTokens));
            var i:uint;
            while (i < itemTokens.length) {
                itemDetail = itemTokens[i].split(",");
                if (itemDetail[3] != undefined){
                    trace(itemDetail);
                    if (this.frames[itemDetail[3]] == null){
                        this.frames[itemDetail[3]] = new Array();
                    };
                    this.itemIDs.push(itemDetail[0]);
                    if (itemDetail.length > 4){
                        this.frames[itemDetail[3]].push({
                            pos:new Point(Number(itemDetail[1]), Number(itemDetail[2])),
                            itemID:itemDetail[0],
                            fct:itemDetail[4],
                            val:itemDetail[5]
                        });
                    }
                    else {
                        this.frames[itemDetail[3]].push({
                            pos:new Point(Number(itemDetail[1]), Number(itemDetail[2])),
                            itemID:itemDetail[0]
                        });
                    };
                };
                i = (i + 1);
            };
            trace(("itemIDs: " + this.itemIDs));
        }

        private function loadInterior(_arg1:String, _arg2:String, _arg3:int):void{
            trace(("interior loading: " + _arg3));
            this.Loaders[String(_arg3)] = new GuildLoader(this.onItemLoadComplete, (this.rootClass.getFilePath() + _arg1), _arg2, _arg3);
        }

        public function onItemLoadComplete(_arg1:GuildLoader):void{
            trace(("item Loaded: " + _arg1.ID));
            this.guildRoot.ItemData[String(_arg1.ID)].c = _arg1.swfClass;
            if (((!((this.guildRoot.ItemData[String(_arg1.ID)].sMeta == null))) && ((this.guildRoot.ItemData[String(_arg1.ID)].sMeta.indexOf("NPC") > -1)))){
                this.guildRoot.ItemData[String(_arg1.ID)].aClass = _arg1.getClass((this.guildRoot.ItemData[String(_arg1.ID)].sLink + "_APOP"));
            };
            delete this.Loaders[String(_arg1.ID)];
        }

        private function onItemClick(_arg1:MouseEvent):void{
            var _local3:Object;
            var _local2:* = this.guildRoot.ItemData[String(_arg1.currentTarget.name)];
            if (_local2 == null){
                return;
            };
            if (this.guildRoot.EditMode){
                return;
            };
            trace(("currentTarget.x: " + MovieClip(_arg1.currentTarget).x));
            if (MovieClip(_arg1.currentTarget).x < 480){
                _local3 = {
                    npcLinkage:(_local2.sLink + "_NPC"),
                    npcEntry:"left",
                    cnt:(_local2.sLink + "_APOP"),
                    scene:"none"
                };
            }
            else {
                _local3 = {
                    npcLinkage:(_local2.sLink + "_NPC"),
                    npcEntry:"right",
                    cnt:(_local2.sLink + "_APOP"),
                    scene:"none"
                };
            };
            this.rootClass.menuClose();
            var _local4:MovieClip = this.rootClass.world.attachMovieFront("Apop");
            trace(((("c: " + this.guildRoot.ItemData[String(_arg1.currentTarget.name)].c) + " aClass: ") + this.guildRoot.ItemData[String(_arg1.currentTarget.name)].aClass));
            _local4.updateWithClasses(_local3, this.guildRoot.ItemData[String(_arg1.currentTarget.name)].c, this.guildRoot.ItemData[String(_arg1.currentTarget.name)].aClass);
        }

        public function addItems(_arg1:String):void{
            var mc:MovieClip;
            var i:uint;
            var f:String = _arg1;
            if (this.frames[f] == null){
                return;
            };
            i = 0;
            while (i < this.frames[f].length) {
                try {
                    mc = new this.guildRoot.ItemData[this.frames[f][i].itemID].c();
                    mc.x = this.frames[f][i].pos.x;
                    mc.y = this.frames[f][i].pos.y;
                    mc.name = this.frames[f][i].itemID;
                    if (((!((this.guildRoot.ItemData[this.frames[f][i].itemID].sMeta == null))) && ((this.guildRoot.ItemData[this.frames[f][i].itemID].sMeta.indexOf("NPC") > -1)))){
                        mc.scaleX = (mc.scaleY = 0.2);
                        if (mc.x > 480){
                            mc.scaleX = (mc.scaleX * -1);
                        };
                        mc.addEventListener(MouseEvent.CLICK, this.onItemClick, false, 0, true);
                    };
                    mc.scaleX = (mc.scaleX * this.rootClass.world.Scale);
                    mc.scaleY = (mc.scaleY * this.rootClass.world.Scale);
                    this.rootClass.world.CHARS.addChild(mc);
                    this.guildRoot.MCs.push(mc);
                }
                catch(e) {
                    trace(e);
                    trace(("itemiD: " + frames[f][i].itemID));
                };
                i = (i + 1);
            };
        }

        public function loadAllItems():void{
            var i:uint;
            try {
                i = 0;
                while (i < this.itemIDs.length) {
                    trace(((("itemIDs[" + i) + "]: ") + this.itemIDs[i]));
                    trace(("guildRoot.ItemData[itemIDs[i]]: " + this.guildRoot.ItemData[this.itemIDs[i]]));
                    if (this.guildRoot.ItemData[this.itemIDs[i]].c == null){
                        try {
                            if (((!((this.guildRoot.ItemData[this.itemIDs[i]].sMeta == null))) && ((this.guildRoot.ItemData[this.itemIDs[i]].sMeta.indexOf("NPC") > -1)))){
                                this.loadInterior(this.guildRoot.ItemData[this.itemIDs[i]].sFile, (this.guildRoot.ItemData[this.itemIDs[i]].sLink + "_NPC"), int(this.itemIDs[i]));
                            }
                            else {
                                this.loadInterior(this.guildRoot.ItemData[this.itemIDs[i]].sFile, this.guildRoot.ItemData[this.itemIDs[i]].sLink, int(this.itemIDs[i]));
                            };
                        }
                        catch(e) {
                            loadInterior(guildRoot.ItemData[itemIDs[i]].sFile, guildRoot.ItemData[itemIDs[i]].sLink, int(itemIDs[i]));
                        };
                    };
                    i = (i + 1);
                };
            }
            catch(e) {
                trace(("loadAllItems: " + e));
                return;
            };
        }

        public function addNewItem(_arg1:String, _arg2:Point, _arg3:Object, _arg4:Class):void{
            trace("addNewItem");
            if (this.frames[_arg1] == null){
                this.frames[_arg1] = new Array();
            };
            this.frames[_arg1].push({
                pos:_arg2,
                itemID:_arg3.ItemID
            });
            if (this.guildRoot.ItemData[_arg3.ItemID] == null){
                this.guildRoot.ItemData[_arg3.ItemID] = _arg3;
                trace("line 96");
                this.guildRoot.ItemData[_arg3.ItemID].c = _arg4;
                this.itemIDs.push(_arg3.ItemID);
            };
        }

        public function removeItem(_arg1:String, _arg2:String):void{
            if (this.frames[_arg1] == null){
                return;
            };
            var _local3:uint;
            while (_local3 < this.frames[_arg1].length) {
                if (this.frames[_arg1][_local3].itemID == _arg2){
                    this.frames[_arg1].splice(_local3, 1);
                    break;
                };
                _local3++;
            };
            trace(("id: " + _arg2));
            var _local4:uint;
            while (_local4 < this.itemIDs.length) {
                trace(((("itemIDs[" + _local4) + "]: ") + this.itemIDs[_local4]));
                trace(("compare: " + (this.itemIDs[_local4] == _arg2)));
                if (this.itemIDs[_local4] == _arg2){
                    this.itemIDs.splice(_local4, 1);
                    return;
                };
                _local4++;
            };
        }

        public function updateItem(_arg1:String, _arg2:Point, _arg3:String):void{
            trace(("updateItem, ID: " + _arg3));
            if (this.frames[_arg1] == null){
                return;
            };
            var _local4:uint;
            while (_local4 < this.frames[_arg1].length) {
                if (this.frames[_arg1][_local4].itemID == _arg3){
                    this.frames[_arg1][_local4].pos = _arg2;
                };
                _local4++;
            };
        }

        public function checkItemID(_arg1:int):Boolean{
            if (this.itemIDs.length < 1){
                return (false);
            };
            var _local2:uint;
            while (_local2 < this.itemIDs.length) {
                if (int(this.itemIDs[_local2]) == _arg1){
                    return (true);
                };
                _local2++;
            };
            return (false);
        }

        public function get IDs():Array{
            return (this.itemIDs);
        }

        public function get IntStr():String{
            var _local2:*;
            var _local3:uint;
            var _local1 = "";
            for (_local2 in this.frames) {
                if (_local2 != "undefined"){
                    _local3 = 0;
                    while (_local3 < this.frames[_local2].length) {
                        if (this.frames[_local2][_local3].fct != null){
                            _local1 = ((((((((((((_local1 + this.frames[_local2][_local3].itemID) + ",") + this.frames[_local2][_local3].pos.x) + ",") + this.frames[_local2][_local3].pos.y) + ",") + _local2) + ",") + this.frames[_local2][_local3].fct) + ",") + this.frames[_local2][_local3].val) + ":");
                        }
                        else {
                            _local1 = ((((((((_local1 + this.frames[_local2][_local3].itemID) + ",") + this.frames[_local2][_local3].pos.x) + ",") + this.frames[_local2][_local3].pos.y) + ",") + _local2) + ":");
                        };
                        _local3++;
                    };
                };
            };
            _local1 = _local1.substr(0, (_local1.length - 1));
            trace(("str: " + _local1));
            return (_local1);
        }

        public function getItemCount(_arg1:String):int{
            if (this.frames[_arg1] == null){
                return (0);
            };
            return (this.frames[_arg1].length);
        }


    }
}//package 

