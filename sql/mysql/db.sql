#
#    Program E
#    Copyright 2002, Paul Rydell
#	
#    This file is part of Program E.
#	
#    Program E is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    Program E is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Program E; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#


#
# Table structure for table `bot`
#

CREATE TABLE IF NOT EXISTS bot (
  id int(11) NOT NULL auto_increment,
  bot tinyint(4) NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  value text NOT NULL,
  PRIMARY KEY  (id),
  KEY botname (bot,name)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# --------------------------------------------------------

#
# Table structure for table `bots`
#

CREATE TABLE IF NOT EXISTS bots (
  id tinyint(3) unsigned NOT NULL auto_increment,
  botname varchar(255) NOT NULL default '',
  PRIMARY KEY  (botname),
  KEY id (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# --------------------------------------------------------

#
# Table structure for table `conversationlog`
#

CREATE TABLE IF NOT EXISTS conversationlog (
  bot tinyint(3) unsigned NOT NULL default '0',
  id int(11) NOT NULL auto_increment,
  input text,
  response text,
  uid varchar(255) default NULL,
  enteredtime timestamp NOT NULL,
  PRIMARY KEY  (id),
  KEY botid (bot)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# --------------------------------------------------------

#
# Table structure for table `dstore`
#

CREATE TABLE IF NOT EXISTS dstore (
  uid varchar(255) default NULL,
  name text,
  value text,
  enteredtime timestamp NOT NULL,
  id int(11) NOT NULL auto_increment,
  PRIMARY KEY  (id),
  KEY nameidx (name(40))
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# --------------------------------------------------------

#
# Table structure for table `gmcache`
#

CREATE TABLE IF NOT EXISTS gmcache (
  id int(11) NOT NULL auto_increment,
  bot tinyint(3) unsigned NOT NULL default '0',
  template int(11) NOT NULL default '0',
  inputstarvals text,
  thatstarvals text,
  topicstarvals text,
  patternmatched text,
  inputmatched text,
  combined text NOT NULL,
  PRIMARY KEY  (id),
  KEY combined (bot,combined(255))
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# --------------------------------------------------------

#
# Table structure for table `gossip`
#

CREATE TABLE IF NOT EXISTS gossip (
  bot tinyint(3) unsigned NOT NULL default '0',
  gossip text,
  id int(11) NOT NULL auto_increment,
  PRIMARY KEY  (id),
  KEY botidx (bot)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# --------------------------------------------------------

#
# Table structure for table `patterns`
#

CREATE TABLE IF NOT EXISTS patterns (
  bot tinyint(3) unsigned NOT NULL default '0',
  id int(11) NOT NULL auto_increment,
  word varchar(255) default NULL,
  ordera tinyint(4) NOT NULL default '0',
  parent int(11) NOT NULL default '0',
  isend tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY wordparent (parent,word),
  KEY botid (bot)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# --------------------------------------------------------

#
# Table structure for table `templates`
#

CREATE TABLE IF NOT EXISTS templates (
  bot tinyint(3) unsigned NOT NULL default '0',
  id int(11) NOT NULL default '0',
  template text NOT NULL,
  pattern varchar(255) default NULL,
  that varchar(255) default NULL,
  topic varchar(255) default NULL,
  PRIMARY KEY  (id),
  KEY bot (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# --------------------------------------------------------

#
# Table structure for table `thatindex`
#

CREATE TABLE IF NOT EXISTS thatindex (
  uid varchar(255) default NULL,
  enteredtime timestamp NOT NULL,
  id int(11) NOT NULL auto_increment,
  PRIMARY KEY  (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;
# --------------------------------------------------------

#
# Table structure for table `thatstack`
#

CREATE TABLE IF NOT EXISTS thatstack (
  thatid int(11) NOT NULL default '0',
  id int(11) NOT NULL auto_increment,
  value varchar(255) default NULL,
  enteredtime timestamp NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_unicode_ci;

    

