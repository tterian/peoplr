# A dirty hack to bypass SSL certificate verification in open-URI
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE