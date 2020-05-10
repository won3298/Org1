/**
 * Created by MS on 2020-05-06.
 */
({
    doCreate : function (component, event, helper){
        console.clear();
        let con = component.get('v.con');
        console.log(con.LastName);



        helper.apex(
            component, 'doCreate','create', {'con':con}
        ).then(function (resData,response){
                 helper.gfn_toast('정상적으로 가입되었습니다.','s');
                 console.log('성공');
                 $A.enqueueAction(component.get('c.doCancel'));
                        helper.gfn_refresh();
                    }).catch(function (error, response) {
                        helper.gfn_ApexErrorHandle(error, response);
                        console.log("fail");
                    });

        },



 doCancel : function(component,event,helper){
            helper.gfn_closeQuickAction(component);
            console.log("nice");
        }



})