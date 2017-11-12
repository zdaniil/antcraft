<?php

// THIS SCRIPT USE CACHE TO REDUCE HIGH LOAD. SO IF CACHE FILE EXIST -
// DELETE IT, WAIT "CACHE EXPIRATION TIME" OR USE "cacheSkip" OPTION TO APPLY CHANGES!

$CONFIG = array(

	// Instagram login
	'LOGIN' => 'antcraft.com.ua',

	// Get pictures from WORLDWIDE by hashtags.
	// Separate hashtags by comma. For example: girl, man
	// Use this options only if you want show pictures of other users.
	// Profile avatar and statistic will be hidden.
	'HASHTAG' => '',

	// Specify here list of banned logins.
	// Photos of these users will not be displayed in widget.
	// Separate usernames by comma. For example: mark18, kitty45
	'bannedLogins' => '',

	// Random order of pictures [ true / false ]
	'imgRandom' => true,

	// How many pictures widget will get from Instagram?
	'imgCount' => 30,

	// Cache expiration time (hours)
	'cacheExpiration' => 1,

	// Skip cache data [ true / false ]
	// If this is true, requests to Instagram API will be sending every time.
	// Warning! Use true option only for debug.
	'cacheSkip' => false,

	// Default language [ ru / en ] or something else from lang directory.
	'langDefault' => 'ru',

	// Language auto-detection [ true / false ]
	// This option may no effect if you set language by $_GET variable.
	'langAuto' => false,

);