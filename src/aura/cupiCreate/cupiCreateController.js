/****************************************************************************************
 * @filename      : cupiCreateController.js
 * @projectname   :
 * @author        : CHOI SEONGWON
 * @date          : 2020-09-03 오전 9:59
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
        helper.fn_InitDataAll(component);

      helper.apex(
          component, 'doInit','init',{'recordId':component.get('v.recordId')}
      ).then(function({resData, response}){
           let phoneNumber = component.get('v.phoneNumber');
           phoneNumber = resData.contact.Phone.split('-');

//          console.log('^__^__^__^__^__^__^__^__^'+resData.contact.Phone);
//          console.log('^__^__^__^__^__^__^__^__^'+phoneNumber[1]);
//          console.log('^__^__^__^__^__^__^__^__^'+resData.contact.Phone.split('-'));
//          console.log('^__^__^__^__^__^__^__^__^'+resData.contact.Phone.split('-')[2]);

          component.set('v.wrapperData',resData);
          component.set('v.phoneNumber',resData.contact.Phone.split('-'));

      }).catch(function ({error, response}) {
          helper.gfn_ApexErrorHandle(error, response);
      });
    },

    doSave : function(component, event, helper){
        let wrapperData = component.get('v.wrapperData');
        wrapperData.contact.Phone = component.get('v.phoneNumber').join("-");

        helper.apex(
            component, 'doSave','save',{'wrapperData':component.get('v.wrapperData')}
        ).then(function({resData,response}){
             helper.gfn_closeQuickActionModal(component);
             helper.gfn_refresh();
        }).catch(function ({error, response}) {
              helper.gfn_ApexErrorHandle(error, response);
        });
    },

     doChange : function (component, event) {
              const e = event.getSource();
              const setCupiField = 'v.wrapperData.contact.'+ e.getLocalId();
              const checked = e.get('v.checked');
              const value = e.get('v.value');
              (checked === value) ? component.set(setCupiField, value) : component.set(setCupiField, !checked);

              const myBoxes = component.find('IsCUPI__c'&&'IsCUPI2__c');
              if(myBoxes.length == 2){
                            component.set('v.isAllSelected',true);
                        }else{
                            component.set('v.isAllSelected',false);
                        }
     },

    //전체선택 및 전체해제
   onSelectAllChange: function(component, event, helper) {
       helper.handleSelectAllChange(component);
     },


})