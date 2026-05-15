/**
 * LinkedInLocationTrigger
 * 
 * Fires on Contact insert and update.
 * When LinkedIn_Location__c is populated (or changed), parses the Clay-sourced
 * LinkedIn location string and conditionally updates MailingCountryCode,
 * MailingStateCode (US only), and MailingCity.
 */
trigger LinkedInLocationTrigger on Contact (before insert, before update) {

    List<Contact> toProcess = new List<Contact>();

    if (Trigger.isInsert) {
        for (Contact c : Trigger.new) {
            if (String.isNotBlank(c.LinkedIn_Location__c)) {
                toProcess.add(c);
            }
        }
    }

    if (Trigger.isUpdate) {
        for (Contact c : Trigger.new) {
            Contact old = Trigger.oldMap.get(c.Id);
            // Only process if LinkedIn_Location__c actually changed
            if (String.isNotBlank(c.LinkedIn_Location__c)
                && c.LinkedIn_Location__c != old.LinkedIn_Location__c) {
                toProcess.add(c);
            }
        }
    }

    if (!toProcess.isEmpty()) {
        
      
        // This updates the data in the Mailing Address
        LinkedInLocationService.parseAndUpdate(toProcess);
        // No explicit DML needed — before trigger modifies records in-place
    }
}