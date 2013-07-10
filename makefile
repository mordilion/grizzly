DATE = $(shell date +%I:%M%p)
GRIZZLY = ./src/grizzly.less
GRIZZLY_RESPONSIVE = ./src/grizzly-responsive.less
GRIZZLY_BOOTSTRAP = ./src/bootstrap-grizzly.less
PROJECTNAME = grizzly
CHECKED=\033[32m✔\033[39m
HR = \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#


# BUILD
build: grizzly


# CLEAN
clean:
	rm -fr ${OUTPUTFOLDER}
	clear


# GRIZZLY
grizzly: clean stylesheets bootstrap


# COMPILE STYLESHEETS
stylesheets:
	@echo "Building Stylesheets ..."
	@mkdir -p ${PROJECTNAME}/stylesheets
	@echo "  Create the Stylesheets-Folder ...                       ${CHECKED} Done"
	@lessc ${GRIZZLY} ${PROJECTNAME}/stylesheets/${PROJECTNAME}.css
	@lessc --compress ${GRIZZLY} ${PROJECTNAME}/stylesheets/${PROJECTNAME}.min.css
	@lessc ${GRIZZLY_RESPONSIVE} ${PROJECTNAME}/stylesheets/${PROJECTNAME}-responsive.css
	@lessc --compress ${GRIZZLY_RESPONSIVE} ${PROJECTNAME}/stylesheets/${PROJECTNAME}-responsive.min.css
	@echo "  Compiling LESS ...                                      ${CHECKED} Done"
	@echo "Stylesheets successfully built at ${DATE}."
	@echo "${HR}${HR}\n"


# BOOTSTRAP EXTENSIONS
bootstrap:
	@echo "Building Bootstrap-Extension ..."
	@mkdir -p ${PROJECTNAME}/bootstrap
	@echo "  Create the Bootstrap-Folder ...                         ${CHECKED} Done"
	@lessc ${GRIZZLY_BOOTSTRAP} ${PROJECTNAME}/bootstrap/css/bootstrap-${PROJECTNAME}.css
	@lessc --compress ${GRIZZLY_BOOTSTRAP} ${PROJECTNAME}/bootstrap/css/bootstrap-${PROJECTNAME}.min.css
	@echo "  Compiling LESS ...                                      ${CHECKED} Done"
	@echo "Bootstrap-Extensions successfully built at ${DATE}."
	@echo "${HR}${HR}\n"