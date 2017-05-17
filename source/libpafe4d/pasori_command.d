module libpafe4d.pasori_command;
import libpafe4d.libpafe;

extern (C) {
  pasori *pasori_open();
  int pasori_init(pasori *p);
  void pasori_close(pasori *p);
  int pasori_send(pasori *p, ubyte *data, int *size);
  int pasori_recv(pasori *p, ubyte *data, int *size);
  int pasori_packet_write(pasori *p, ubyte *data, int *size);
  int pasori_packet_read(pasori * p, ubyte * data, int *size);
  int pasori_write(pasori *p, ubyte *data, int *size);
  int pasori_read(pasori *p, ubyte *data, int *size);
  int pasori_reset(pasori * p);
  int pasori_version(pasori *p, int *v1, int *v2);
  int pasori_type(pasori *p);

  int pasori_test(pasori *p, int code, ubyte *data, int *size, ubyte *rdata, int *rsize);
  int pasori_test_echo(pasori *p, ubyte *data, int *size);
  int pasori_test_eprom(pasori *p);
  int pasori_test_ram(pasori *p);
  int pasori_test_cpu(pasori *p);
  int pasori_test_polling(pasori *p);
  int pasori_list_passive_target(pasori *pp, ubyte *payload, int *size);

  void pasori_set_timeout(pasori *p, int timeout);
}

X L8(x)(X x) {
  return x & 0xff;
}

X H8(X)(X x) {
  return ((x >> 8) & 0xff);
}

