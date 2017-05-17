module libpafe4d.felica_command;
import libpafe4d.libpafe;

extern (C) {
  felica *felica_polling(pasori *p, ushort systemcode, ubyte RFU, ubyte timeslot);
  int felica_get_idm(felica *f, ubyte *idm);
  int felica_get_pmm(felica *f, ubyte *idm);
  int felica_read(felica * f, int *n, felica_block_info *info, ubyte *data);
  int felica_read_single(felica * f, int servicecode, int mode, ubyte addr, ubyte *data);
  int felica_write(felica *f, int servicecode, int mode, ubyte addr, ubyte *data);
  int felica_request_service(felica *f, int *n, ushort *list, ushort *data);
  int felica_request_response(felica *f, ubyte *mode);
  int felica_search_service(felica *f);
  int felica_request_system(felica *f, int *n, ushort *data);
}
