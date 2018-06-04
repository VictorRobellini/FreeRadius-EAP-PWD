eap {
	default_eap_type = peap
	timer_expire     = 60
	ignore_unknown_eap_types = no
	cisco_accounting_username_bug = no
	max_sessions = ${max_requests}
	md5 {
	}
	pwd {
		group = 19
		server_id = theserver@example.com
		fragment_size = 1020
		virtual_server = "inner-tunnel"
	}
	leap {
	}
	gtc {
		auth_type = PAP
	}
	tls-config tls-common {
		private_key_password = whatever
		private_key_file = ${certdir}/server.pem
		certificate_file = ${certdir}/server.pem
		ca_file = ${cadir}/ca.pem
		dh_file = ${certdir}/dh
		ca_path = ${cadir}
		cipher_list = "HIGH"
		cipher_server_preference = no
		ecdh_curve = "secp384r1"
		disable_tlsv1_2 = no
		cache {
			name = "EAP-TLS"
			enable = no
			lifetime = 24 # hours
			persist_dir = "/var/log/freeradius/tlscache"
		}
		verify {
		}
		ocsp {
			enable = no
			override_cert_url = yes
			url = "http://127.0.0.1/ocsp/"
		}
	}
	tls {
		tls = tls-common
	}
	ttls {
		tls = tls-common
		default_eap_type = md5
		copy_request_to_tunnel = yes
		use_tunneled_reply = yes
		virtual_server = "inner-tunnel"
	}
	peap {
		tls = tls-common
		default_eap_type = mschapv2
		copy_request_to_tunnel = yes
		use_tunneled_reply = yes
		virtual_server = "inner-tunnel"
	}
	mschapv2 {
	}
}
