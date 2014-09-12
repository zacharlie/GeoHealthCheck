# =================================================================
#
# Authors: Tom Kralidis <tomkralidis@gmail.com>
#
# Copyright (c) 2014 Tom Kralidis
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# =================================================================

setup: deps
	cp GeoHealthCheck/config.py instance/config.py
	@echo "\nGeoHealthCheck is now built.  Edit settings in instance/config.py"
	@echo "before deploying the application.  Alternatively, you can start a"
	@echo "development instance with 'python GeoHealthCheck/app.py'\n"

deps: tmp instance static_libs
	wget -P tmp http://startbootstrap.com/downloads/sb-admin-2.zip | lwp-download http://startbootstrap.com/downloads/sb-admin-2.zip tmp/sb-admin-2.zip
	cd tmp && unzip sb-admin-2.zip
	cd tmp/sb-admin-2/ && mv css font-awesome-4.1.0 fonts js less ../../GeoHealthCheck/static/lib

tmp:
	mkdir -p $@

instance:
	mkdir -p $@

static_libs:
	mkdir -p GeoHealthCheck/static/lib

clean:
	rm -fr tmp
	rm -fr instance
	rm -fr GeoHealthCheck/static/lib
