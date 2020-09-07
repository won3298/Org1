/**
** @filename     : ZZ_addInformation
* @projectname   :
* @author        : CHOI SEONGWON
* @date          : 2020-08-28 오후 1:31
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
public with sharing class ZZ_addInformation {

//    public class InitData extends I2ComClass.InitData{
//         @AuraEnabled public Contact contact {get;set;}
//    }

    public class InitData{
        @AuraEnabled public Contact contact{get;set;}
    }

    @AuraEnabled
    public static InitData init(final String recordId){
        InitData initData = new InitData();
        initData.contact= [
                SELECT Id, LastName, Department,Phone,
                        Email,Languages__c,Level__c
                FROM Contact
                WHERE Id = :recordId
        ];

        return  initData;
    }


    @AuraEnabled
    public static void save(InitData initData) {

        Contact updateContact = new Contact(Id = initData.contact.Id);
        updateContact.LastName = initData.contact.LastName;
        updateContact.Department = initData.contact.Department;
        updateContact.Phone = initData.contact.Phone;
        updateContact.Email = initData.contact.Email;
        updateContact.Languages__c =  initData.contact.Languages__c;
        updateContact.Level__c = initData.contact.Level__c;

        update updateContact;

//        return initData2;
    }

}