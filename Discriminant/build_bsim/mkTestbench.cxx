/*
 * Generated by Bluespec Compiler, version 2024.07 (build b4f31db)
 * 
 * On Thu Oct 24 10:22:01 IST 2024
 * 
 */
#include "bluesim_primitives.h"
#include "mkTestbench.h"


/* String declarations */
static std::string const __str_literal_1("Displaying  Values:", 19u);
static std::string const __str_literal_2("The discriminant is : = %d", 26u);


/* Constructor */
MOD_mkTestbench::MOD_mkTestbench(tSimStateHdl simHdl, char const *name, Module *parent)
  : Module(simHdl, name, parent), __clk_handle_0(BAD_CLOCK_HANDLE), PORT_RST_N((tUInt8)1u)
{
  symbol_count = 3u;
  symbols = new tSym[symbol_count];
  init_symbols_0();
}


/* Symbol init fns */

void MOD_mkTestbench::init_symbols_0()
{
  init_symbol(&symbols[0u], "CAN_FIRE_RL_start", SYM_DEF, &DEF_CAN_FIRE_RL_start, 1u);
  init_symbol(&symbols[1u], "RL_start", SYM_RULE);
  init_symbol(&symbols[2u], "WILL_FIRE_RL_start", SYM_DEF, &DEF_WILL_FIRE_RL_start, 1u);
}


/* Rule actions */

void MOD_mkTestbench::RL_start()
{
  tUInt32 DEF_signed_4294967192___d1;
  DEF_signed_4294967192___d1 = 4294967192u;
  dollar_display(sim_hdl, this, "s", &__str_literal_1);
  dollar_display(sim_hdl, this, "s,-32", &__str_literal_2, DEF_signed_4294967192___d1);
  dollar_finish(sim_hdl, "32", 1u);
}


/* Methods */


/* Reset routines */

void MOD_mkTestbench::reset_RST_N(tUInt8 ARG_rst_in)
{
  PORT_RST_N = ARG_rst_in;
}


/* Static handles to reset routines */


/* Functions for the parent module to register its reset fns */


/* Functions to set the elaborated clock id */

void MOD_mkTestbench::set_clk_0(char const *s)
{
  __clk_handle_0 = bk_get_or_define_clock(sim_hdl, s);
}


/* State dumping routine */
void MOD_mkTestbench::dump_state(unsigned int indent)
{
}


/* VCD dumping routines */

unsigned int MOD_mkTestbench::dump_VCD_defs(unsigned int levels)
{
  vcd_write_scope_start(sim_hdl, inst_name);
  vcd_num = vcd_reserve_ids(sim_hdl, 3u);
  unsigned int num = vcd_num;
  for (unsigned int clk = 0u; clk < bk_num_clocks(sim_hdl); ++clk)
    vcd_add_clock_def(sim_hdl, this, bk_clock_name(sim_hdl, clk), bk_clock_vcd_num(sim_hdl, clk));
  vcd_write_def(sim_hdl, bk_clock_vcd_num(sim_hdl, __clk_handle_0), "CLK", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "CAN_FIRE_RL_start", 1u);
  vcd_write_def(sim_hdl, num++, "RST_N", 1u);
  vcd_set_clock(sim_hdl, num, __clk_handle_0);
  vcd_write_def(sim_hdl, num++, "WILL_FIRE_RL_start", 1u);
  vcd_write_scope_end(sim_hdl);
  return num;
}

void MOD_mkTestbench::dump_VCD(tVCDDumpType dt, unsigned int levels, MOD_mkTestbench &backing)
{
  vcd_defs(dt, backing);
}

void MOD_mkTestbench::vcd_defs(tVCDDumpType dt, MOD_mkTestbench &backing)
{
  unsigned int num = vcd_num;
  if (dt == VCD_DUMP_XS)
  {
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
    vcd_write_x(sim_hdl, num++, 1u);
  }
  else
    if (dt == VCD_DUMP_CHANGES)
    {
      if ((backing.DEF_CAN_FIRE_RL_start) != DEF_CAN_FIRE_RL_start)
      {
	vcd_write_val(sim_hdl, num, DEF_CAN_FIRE_RL_start, 1u);
	backing.DEF_CAN_FIRE_RL_start = DEF_CAN_FIRE_RL_start;
      }
      ++num;
      if ((backing.PORT_RST_N) != PORT_RST_N)
      {
	vcd_write_val(sim_hdl, num, PORT_RST_N, 1u);
	backing.PORT_RST_N = PORT_RST_N;
      }
      ++num;
      if ((backing.DEF_WILL_FIRE_RL_start) != DEF_WILL_FIRE_RL_start)
      {
	vcd_write_val(sim_hdl, num, DEF_WILL_FIRE_RL_start, 1u);
	backing.DEF_WILL_FIRE_RL_start = DEF_WILL_FIRE_RL_start;
      }
      ++num;
    }
    else
    {
      vcd_write_val(sim_hdl, num++, DEF_CAN_FIRE_RL_start, 1u);
      backing.DEF_CAN_FIRE_RL_start = DEF_CAN_FIRE_RL_start;
      vcd_write_val(sim_hdl, num++, PORT_RST_N, 1u);
      backing.PORT_RST_N = PORT_RST_N;
      vcd_write_val(sim_hdl, num++, DEF_WILL_FIRE_RL_start, 1u);
      backing.DEF_WILL_FIRE_RL_start = DEF_WILL_FIRE_RL_start;
    }
}
