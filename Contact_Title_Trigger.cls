trigger ContactTitleTrigger on Contact (before insert, before update) {
    for (Contact c : Trigger.new) {
        if (String.isNotBlank(c.Title)) {
            c.Title = TitleStandardizer.standardize(c.Title);
        }
    }
}