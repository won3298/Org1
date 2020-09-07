/****************************************************************************************
 * @filename      : cupiCreateHelper.js
 * @projectname   :
 * @author        : CHOI SEONGWON
 * @date          : 2020-09-03 오후 2:02
 * @group         :
 * @group-content :
 * @description   :
 * @reference     :
 * @copyright     : Copyright © I2max. All Rights Reserved.
 * ===============================================================
 * ver     date                author              description
 * ===============================================================
    0.1                Choi SeongWon         Create
 ****************************************************************************************/
({
    fn_InitDataAll : function(component){
        this.fn_InitPrefixPhoneNumber(component);
     },

    fn_InitPrefixPhoneNumber : function (component) {
            let prefixPhoneNumber = component.get('v.prefixPhoneNumber');
            prefixPhoneNumber = [
                {'label':'010', 'value':'010'}, {'label':'011', 'value':'011'},
                {'label':'016', 'value':'016'}, {'label':'017', 'value':'017'},
                {'label':'512', 'value':'512'}
                ];
            component.set('v.prefixPhoneNumber', prefixPhoneNumber);
        },

        //체크박스 (AllSelect 관련)
        handleSelectAllChange: function(component) {
           if(component.get('v.isAllSelected') == false) {
             component.set('v.isAllSelected', true);
           }
           else{
               component.set('v.isAllSelected',false);
           }
           const myCheckboxes = component.find('myCheckboxes');
           let chk = (myCheckboxes.length == null) ? [myCheckboxes] : myCheckboxes;
           chk.forEach(checkbox => checkbox.set('v.checked', component.get('v.isAllSelected')));

       },

});