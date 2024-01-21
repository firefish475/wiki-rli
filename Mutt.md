Managing Email to save online storage and archive locally
=========================================================

Use mbsync to sync mail to local mailbox without deleting. So local mail fills up endlessly.

Or use Mutt imap feature to enter imap "mailbox" which is remotely and copy/move messages to local mailbox.

Use mutt to connect to imap mailbox on server and tag messages to delete messages up to a certain date.

Press in index view:

1. od              # sort by date
2. /~d 06/09/23    # search message from 06.09.2023
3. T~m 1000-2000   # tag-pattern messages form index 1000 to index 2000
4. Look at the tagged messages count. This is what mbsync should have downloaded.


< jindraj> to get diff: how about going to first mailbox tag all messages, tag-prefix pipe through `sed -n 
                 '/^message-id/Ip' >> /tmp/first`. Analogically for the other mailbox. Then do the diff with the 
                 tool of your choice.

# Compare mailboxes by extracting message-id of all messages each
# beware of $pipe_decode and $pipe_decode_weed

:ignore *
:unignore Message-ID:   # pipe message including Message-ID
od      # Sort by Date
T~A     # Tag all messages
;|sed -n '/^message-id/Ip' >> /tmp/first
c       # change to second mailbox
;|sed -n '/^message-id/Ip' >> /tmp/second


Go to IMAP inbox:
mutt -F path/to/muttrc

# Delete Email up to some point in time:
od              # sort by Date
T~r-31/12/22    # tag-pattern -r range up to -DATE
;d              # tag-prefix delete messages tagged
