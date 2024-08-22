# What does it do?

When adventuring in older parts of Azeroth - for example legacy raid content - you will often find your bags filled with low level items.

This super-lightweight addon aims to help you sell all of these items with a single click of a button (or a single chat command).


## Improved Sell Junk button

The default "Sell Junk" button can be replaced (see screenshot) with an improved version, that will also sell low level items according to your preferences.

   * If you don't want to replace the original button, you can disable the Improved Sell Junk button from the addon options (in this case you can still use the chat command - see below).
   * You can specify what counts as a "low level item", by setting a percentage threshold compared to your currently equipped item level. For example, with the default setting of 75%, if your current item level is 400, then any item with an item level of 300 or below will be considered as low level and will be sold.
   * You can enable "Safe Sell" mode, which will only sell a maximum of 12 items - so that you can buy back anything if you change your mind. This option is disabled by default. It is highly recommended to enable the "Safe Sell" mode when you first install and try out the addon - or at least store any valuable gear/items in your bank until you are comfortable using it.

## "/sell" command

You also get a handy command to sell those legacy items. This is very useful if you want more control of the item level threshold, or if you don't want to use the "Improved Sell Junk" button for any reason.

Here is how you can use it:

   * `/sell`: sell junk and low level items according to the threshold specified in the options
   * `/sell 150`: sell junk and items that are of item level 150 or below
   * `/sell config`: open the addon options page

 
Note: in each case you must have the vendor window open, otherwise the addon will not sell anything.


## Special Cases

__The following items will also be sold:__

   * legion artifact items, if they are below the specified item level
   * legacy consumables, food & drink items

# Bug reports

Please report issues using the GitHub issue tracker.

Note: there is a small delay between selling each individual item. This is an intended behavior to avoid running into Blizzard API rate limiting. Please do not report this as a problem.

# Contribution

The source code is free and open-source. You can access it from the "Source" tab.