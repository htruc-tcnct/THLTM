package model.bean;

public class NhanVien {
	public NhanVien(String iDNV, String hoten, String diachi, String iDPB) {
		super();
		IDNV = iDNV;
		Hoten = hoten;
		Diachi = diachi;
		IDPB = iDPB;
	}

	private String IDNV;
	private String Hoten;
	private String Diachi;
	private String IDPB;

	public String getIDNV() {
		return IDNV;
	}

	public void setIDNV(String iDNV) {
		IDNV = iDNV;
	}

	public String getHoten() {
		return Hoten;
	}

	public void setHoten(String hoten) {
		Hoten = hoten;
	}

	public String getDiachi() {
		return Diachi;
	}

	public void setDiachi(String diachi) {
		Diachi = diachi;
	}

	public String getIDPB() {
		return IDPB;
	}

	public void setIDPB(String iDPB) {
		IDPB = iDPB;
	}

}
