/**
** @filename     : CupiCreate
* @projectname   :
* @author        : CHOI SEONGWON
* @date          : 2020-09-03 오전 9:37
* @group         :
* @group-content :
* @description   :
* @tester        :
* @reference     :
* @copyright     : Copyright © I2max. All Rights Reserved.
* @modification Log
* ===============================================================
* ver     date             author              description
* ===============================================================
  0.1                            Create
 */
public with sharing class CupiCreate {
    @AuraEnabled
    public static WrapperData init(String recordId){
        WrapperData wrapperData = new WrapperData();
        wrapperData.contact = [
                SELECT Id, FirstName, LastName, Phone, CUPI__c, IsCUPI__c, IsCUPI2__c
                FROM Contact
                WHERE Id = :recordId
        ];

        return wrapperData;
    }

    @AuraEnabled
    public static void save(WrapperData wrapperData){

//        List<String> personMobilePhone = wrapperData.contact.Phone.trim().split('-');
//        List<String> personContactDuplicateDataList = new List<String>();
//        personContactDuplicateDataList.add(personMobilePhone[0]+personMobilePhone[1]+personMobilePhone[2]);


        Contact updatecontact = new Contact(Id = wrapperData.contact.Id);
        updatecontact.IsCUPI__c = wrapperData.contact.IsCUPI__c;
        updatecontact.IsCUPI2__c = wrapperData.contact.IsCUPI2__c;
        updatecontact.Phone     = wrapperData.contact.Phone;
        update updatecontact;
    }

    public class WrapperData{
        @AuraEnabled public Contact contact{get;set;}
//        @AuraEnabled public Contact contact{get{
//            if(this.contact == null){
//                this.contact=new Contact();
//                this.contact.IsCUPI__c = true;
//            }
//            return this.contact;
//        }set;}
    }

}