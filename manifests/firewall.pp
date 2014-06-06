# Class varnish::firewall
#
# Uses puppetlabs/firewall module to open port 80
#
class varnish::firewall (
	$manage_firewall     = true,
	$varnish_listen_port = '6081',
) {

	if $manage_firewall {
		firewall { "100 allow port $varnish_listen_port to varnish":
			chain  => 'INPUT',
			proto  => 'tcp',
			state  => ['NEW'],
			dport  => $varnish_listen_port,
			action => 'accept',
		}
	}
}
