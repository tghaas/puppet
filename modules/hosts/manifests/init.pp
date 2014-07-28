class hosts{
	host { 'coder.topcoder.com':
	   					ip => '192.168.45.200',
	}
	host { 'apps.topcoder.com':
	   					ip => '192.168.7.83',
	}
	host { 'community.topcoder.com':
	   					ip => '192.168.7.84',
	}
	host { 'www.topcoder.com':
	   					ip => '192.168.7.99',
		host_aliases => ['topcoder.com'],
	}
	host { 'software.topcoder.com':
	   					ip => '192.168.7.95',
	}
	host { 'studio.topcoder.com':
	   					ip => '192.168.7.93',
	}
	host { 'api.topcoder.com':
	   					ip => '192.168.7.103',
	}
}

