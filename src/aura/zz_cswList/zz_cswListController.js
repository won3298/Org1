/****************************************************************************************
 * @filename      : zz_cswListController.js
 * @projectname   :
 * @author        : CHOI SEONGWON
 * @date          : 2020-08-11 오후 4:44
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
    doInit : function(component, event, helper){
        helper.lacComService = component.find('lacComService');

       helper.lacComService.doGetSobjectData(['Account', 'Case'], function(resData){

                      component.set('v.labelMap',resData);
                  });

        helper.fn_initSearch(component);

        helper.apex(
            component, 'doInit','init', null
        ).then(function(resData,response){
            component.set('v.initData',resData);

            $A.enqueueAction(component.get('c.doSearch'));
        }).catch(function(error, response){
            helper.gfn_ApexErrorHandle(error, response);
        });

    },

    doSearch : function(component, event, helper){

        helper.gfn_pageFrameReset(component, 'table', 'search')
                   .then(function (params) {
                       console.log('resolve params : ', params);
                       return helper.gfn_search(component,5, 1, params.tableId, params.apexCallMethodName);
                   }).catch(function (error) {
                   helper.gfn_ApexErrorHandle(error);
               });
    },

     doNaviService : function(component, event, helper){
             const recordId = event.currentTarget.dataset.recordid;

             helper.lacComService.doNaviService({
                 "type": "standard__recordPage",
                 "attributes": {
                     "recordId": recordId,
                     "objectApiName": "Account",
                     "actionName": "view"
                 }
             });
         },
});