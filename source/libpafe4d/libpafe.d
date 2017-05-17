module libpafe4d.libpafe;
import libusb;

extern (C) {
  enum PASORI_TYPE {
    PASORI_TYPE_S310,
    PASORI_TYPE_S320,
    PASORI_TYPE_S330
  }

  struct pasori {
    libusb_device **devs;
    libusb_context *ctx;
    libusb_device_handle *dh;
    libusb_device_descriptor desc;

    int b_ep_in, b_ep_out, i_ep_in;
    int timeout;
    PASORI_TYPE type;
  }


  struct felica_area {
    ushort code, attr, bin;
    felica_area *next;
  }

  /* DEFINE felica */
  struct felica {
    pasori *p;
    ushort systemcode;
    ubyte[8] IDm;
    ubyte[8] PMm;
    ushort area_num;
    felica_area[256] area;
    ushort service_num;
    felica_area[256] service;
    felica *next;
  }

  struct felica_block {
    ubyte[8] data;
  }

  struct felica_block_info {
    ushort service;
    ubyte mode;
    ushort block;
  }

  /* DEFINE constants */

  enum FELICA_IDM_LENGTH = 8;
  enum FELICA_PMM_LENGTH = 8;
  enum FELICA_BLOCK_LENGTH = 16;

  enum FELICA_AREA_NUM_MAX = 121;

  enum FELICA_POLLING_ANY   = 0xffff;
  enum FELICA_POLLING_SUICA = 0x0003;
  enum FELICA_POLLING_EDY   = 0xfe00;


  enum FELICA_SERVICE_SUICA_IN_OUT  = 0x108f;
  enum FELICA_SERVICE_SUICA_HISTORY = 0x090f;
  enum FELICA_SERVICE_IRUCA_HISTORY = 0xde80;
  enum FELICA_SERVICE_EDY_NUMBER  = 0x110b;
  enum FELICA_SERVICE_EDY_HISTORY = 0x170f;


  enum FELICA_CMD_POLLING = 0;
  enum FELICA_ANS_POLLING = 1;

  enum FELICA_CMD_REQUEST_SERVICE = 2;
  enum FELICA_ANS_REQUEST_SERVCCE = 3;

  enum FELICA_CMD_REQUEST_RESPONSE = 4;
  enum FELICA_ANS_REQUEST_RESPONSE = 5;

  enum FELICA_CMD_READ_WITHOUT_ENCRYPTION = 6;
  enum FELICA_ANS_READ_WITHOUT_ENCRYPTION = 7;

  enum FELICA_CMD_WRITE_WITHOUT_ENCRYPTION = 8;
  enum FELICA_ANS_WRITE_WITHOUT_ENCRYPTION = 9;

  enum FELICA_CMD_AUTHENTICATION1 = 0x10;
  enum FELICA_ANS_AUTHENTICATION1 = 0x11;

  enum FELICA_CMD_AUTHENTICATION2 = 0x12;
  enum FELICA_ANS_AUTHENTICATION2 = 0x13;

  enum FELICA_CMD_READ_FROM_SECURE_FILE = 0x14;
  enum FELICA_ANS_READ_FROM_SECURE_FILE = 0x15;

  enum FELICA_CMD_WRITE_TO_SECURE_FILE = 0x16;
  enum FELICA_ANS_WRITE_TO_SECURE_FILE = 0x17;


  enum FELICA_CMD_SEARCH_SERVICE_CODE = 0x0a;
  enum FELICA_ANS_SEARCH_SERVICE_CODE = 0x0b;

  enum FELICA_CMD_REQUEST_SYSTEM = 0x0c;
  enum FELICA_ANS_REQUEST_SYSTEM = 0x0d;


  enum PASORI2_CMD_SELF_DIAGNOSIS = 0x52;
  enum PASORI2_ANS_SELF_DIAGNOSIS = 0x53;

  enum PASORI2_CMD_GET_FIRMWARE_VERSION = 0x58;
  enum PASORI2_ANS_GET_FIRMWARE_VERSION = 0x59;

  enum PASORI2_CMD_SEND_PACKET = 0x5c;
  enum PASORI2_ANS_SEND_PACKET = 0x5d;

  enum PASORI2_DIAG_COMMUNICATION_LINE_TEST = 0x00;
  enum PASORI2_DIAG_EEPROM_TEST = 0x01;
  enum PASORI2_DIAG_RAM_TEST = 0x02;
  enum PASORI2_DIAG_CPU_FUNCTION_TEST = 0x03;
  enum PASORI2_DIAG_CPU_FANCTION_TEST = 0x03;
  enum PASORI2_DIAG_POLLING_TEST_TO_CARD = 0x10;


  enum PASORI_ERR_PARM = 1;
  enum PASORI_ERR_MEM  = 2;
  enum PASORI_ERR_COM  = 3;
  enum PASORI_ERR_DATA = 4;
  enum PASORI_ERR_CHKSUM = 5;
  enum PASORI_ERR_FORMAT = 6;
  enum PASORI_ERR_TYPE = 7;
}
