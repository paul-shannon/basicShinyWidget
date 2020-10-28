default:
	@echo available targets: roxy install demo all

all: roxy install demo

roxy:
	R -e "devtools::document()"

install:
	R CMD INSTALL .  --no-test-load

demo:
	(cd inst/demos; R -f basicWidgetDemo.R)


