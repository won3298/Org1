/****************************************************************************************
 * @filename      : zz_TestListController.js
 * @projectname   :
 * @author        : CHOI SEONGWON
 * @date          : 2020-08-21 오후 1:51
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
//            helper.fn_initSearch(component);
            $A.enqueueAction(component.get('c.doSearch'));


//            helper.apex(
//                component, 'doInit','init', null
//            ).then(function(resData,response){
//                component.set('v.initData',resData);
//                $A.enqueueAction(component.get('c.doSearch'));
//                helper.fn_initSearch(component);
//            }).catch(function(error, response){
//                helper.gfn_ApexErrorHandle(error, response);
 //            });

    },

    doSearch : function(component, event, helper){

            helper.gfn_pageFrameReset(component, 'table', 'search')
                       .then(function (params) {
                           console.log('resolve params : ', params);
                           return helper.gfn_search(component,10, 1, params.tableId, params.apexCallMethodName);
                       }).catch(function (error) {
                       helper.gfn_ApexErrorHandle(error);
                   });

                   if(component.get('v.reqData.searchType')==='2'){
                       helper.apex(
                           component, 'doInit', 'getOptions',null
                       ).then(function({resData,response}){
                           component.set('v.seriesOptions',resData);
                       }).catch(function({error, response}){
                          helper.gfn_ApexErrorHandle(error, response);
                       });
                   }
        },

        doChange : function(component, event, helper){


        },

});