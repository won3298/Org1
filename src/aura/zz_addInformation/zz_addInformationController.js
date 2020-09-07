/****************************************************************************************
 * @filename      : zz_addInformationController.js
 * @projectname   :
 * @author        : CHOI SEONGWON
 * @date          : 2020-08-28 오후 2:12
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

    doInit: function (component, event, helper) {
        helper.lacComService = component.find('lacComService');

        console.log('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
            helper.apex(
                component, 'doInit', 'init',{
                    "recordId":component.get('v.contactId')
            }).then(function ({resData, response}) {
                component.set('v.initData', resData);
                console.log('^^^^^^^^^^^^^^^^^^^^^'+JSON.stringify(component.get('v.initData.contact',resData)));

                component.set('v.datalist',JSON.stringify(component.get('v.initData.contact',resData)));
                console.log(component.get('v.datalist'));

            }).catch(function ({error, response}) {
               console.log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
                helper.gfn_ApexErrorHandle(error, response);
            });
        },

     doSave : function (component, event, helper) {
         const quoteWp = JSON.stringify(component.get('v.initData.contact'));
         const obj = JSON.parse(quoteWp);

            // 기존 값과 변화 없으면 else로 이동,  값이 바뀌었다면 저장 가능 하도록 설정
            if(component.get('v.datalist')!=quoteWp){
                helper.apex(
                         component, 'doSave', 'save' ,
                        { 'initData' : component.get('v.initData')}
                        ).then(function ({resData, response}) {
                        component.set('v.initData', resData);
                        helper.gfn_toast('정상적으로 저장되었습니다.','s');
                        console.log(component.get('v.datalist'));
                        console.log('111111111111111111111111111#@'+ obj.Department);

                         helper.gfn_closeQuickActionModal(component);
                         helper.gfn_refresh();
                     }).catch(function ({error, response}) {
                         helper.gfn_ApexErrorHandle(error, response);
                     });
              }else { helper.gfn_ApexErrorHandle('수정사항이 없습니다.','s');}

        },

});