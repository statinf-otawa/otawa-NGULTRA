/* Generated by gliss-attr ($(date)) copyright (c) 2009 IRIT - UPS */

#include <$(proc)/api.h>
#include <$(proc)/id.h>
#include <$(proc)/macros.h>
#include <$(proc)/grt.h>

#ifdef __cplusplus
extern "C" {
#endif

r52f_time_t *R52F_time_return;
typedef void (*fun_t)($(proc)_inst_t *inst);
#define SET_TIME(x)	R52F_time_return = &x

/*** function definition ***/

void ngUltra_r52f_time_UNKNOWN($(proc)_inst_t *inst) {
	SET_TIME(R52F_time_unknown);
}

$(foreach instructions)
void ngUltra_r52f_time_$(IDENT)($(proc)_inst_t *inst) {
$(cortexR52F_time)
};
$(end)


/*** function table ***/
static fun_t time_funs[] = {
	ngUltra_r52f_time_UNKNOWN$(foreach instructions),
	ngUltra_r52f_time_$(IDENT)$(end)
};

/**
 * Get the ngUltra_r52f timing.
 * @return ngUltra_r52f timing.
 */
r52f_time_t *ngUltraR52F(void *_inst) {
	arm_inst_t *inst = static_cast<arm_inst_t *>(_inst);
	time_funs[inst->ident](inst);
	return R52F_time_return;
}

#ifdef __cplusplus
}
#endif
