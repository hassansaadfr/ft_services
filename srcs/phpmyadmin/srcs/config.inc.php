<?php
	$i = 0;

	/**
	 * First server
	 */
	$i++;
	/* Authentication type */
	$cfg['Servers'][$i]['auth_type'] = 'cookie';
	/* Server parameters */
	$cfg['Servers'][$i]['host'] = 'mysql';
	$cfg['Servers'][$i]['compress'] = FALSE;
	$cfg['PmaAbsoluteUri'] = 'https://node_ip:5000/phpmyadmin';
?>
