package productManage.action.sample;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import jxl.Cell;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.whq.Sample;
import productManage.model.whq.SampleStorageDetail;
import productManage.service.sample.SampleManageService;

/**
 * @author WHQ
 * @date 创建时间2016-3-8
 */
public class SampleAction extends PageAction {
	@Autowired
	private SampleManageService samplemanageservice;

	private String designID;
	private String samplePlace;
	private String sampleOPComment;
	private File file;
	private String fileFilename;
	private String fileContentType;
	// 样衣筛选条件:
	private String searchSamplePlace;
	private String searchDesignCode;
	private String searchSampleState;

	public String addSample() {
		if (request.getSession().getAttribute("account") != null) {
			System.out.println("enter addSample action");
			return "success";
		} else {
			return "failed";
		}

	}

	public String addInSample() {
		if (request.getSession().getAttribute("account") != null) {

			System.out.println("enter addInSample action");

			samplemanageservice.SampleInput(designID, samplePlace,
					sampleOPComment);
			return "success";
		} else {
			return "failed";
		}
	}

	// ---------------以下为样衣管理-----------------
	public String showAllSamples() {
		if (request.getSession().getAttribute("account") != null) {

			pageBean = samplemanageservice.showAllSamples(this.rowsPerPage,
					this.page);
			return "success";
		} else {
			return "failed";
		}
	}

	public String showSamplesByFilter() {
		if (request.getSession().getAttribute("account") != null) {

			Map filter = new HashMap();
			filter.put("samplePlace", searchSamplePlace);
			filter.put("designCode", searchDesignCode);
			filter.put("sampleState", searchSampleState);
			pageBean = samplemanageservice.showSamplesByFilter(
					this.rowsPerPage, this.page, filter);
			return "success";
		} else {
			return "failed";
		}
	}

	public String importSample() {
		if (request.getSession().getAttribute("account") != null) {

			jxl.Workbook readwb = null;
			try {
				InputStream instream = new FileInputStream(file);
				readwb = Workbook.getWorkbook(instream);
				Sheet readsheet = readwb.getSheet(0);
				int rsColumns = readsheet.getColumns();
				int rsRows = readsheet.getRows();
				for (int i = 1; i < rsRows; i++) {
					Cell cellLocation = readsheet.getCell(0, i);
					Cell cellDesignCode = readsheet.getCell(1, i);
					Cell cellSampleState = readsheet.getCell(2, i);
					Cell cellOPType = readsheet.getCell(3, i);
					DateCell cellOPTime = (DateCell) readsheet.getCell(4, i);
					Cell cellOPComment = readsheet.getCell(5, i);

					String sampleLocation = cellLocation.getContents();
					String designCode = cellDesignCode.getContents();
					String sampleState = cellSampleState.getContents();
					String OPType = cellOPType.getContents();
					java.util.Date OPTime = cellOPTime.getDate();
					String OPComment = cellOPComment.getContents();
					Sample sample = samplemanageservice.getSample(
							sampleLocation, designCode);
					if (sample == null) {
						System.out.println("designCode:" + designCode);
						// 如果sample是空的话，就先插入这条sample
						Sample insertResult = samplemanageservice.addSample(
								designCode, sampleLocation, sampleState);
						// 然后再创建sampleStorageDtail
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyy-MM-dd");
						String timeStampInit = sdf.format(OPTime);
						Timestamp time = Timestamp.valueOf(timeStampInit
								+ " 00:00:00");
						SampleStorageDetail sampleStorageDetail = new SampleStorageDetail();
						sampleStorageDetail.setSample(insertResult);
						sampleStorageDetail.setSampleOPComment(OPComment);
						sampleStorageDetail.setSampleOPTime(time);
						sampleStorageDetail.setSampleOPType(OPType);
						samplemanageservice
								.addSampleStorageDetail(sampleStorageDetail);
					} else {
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyy-MM-dd");
						String timeStampInit = sdf.format(OPTime);
						Timestamp time = Timestamp.valueOf(timeStampInit
								+ " 00:00:00");
						SampleStorageDetail sampleStorageDetail = new SampleStorageDetail();
						sampleStorageDetail.setSample(sample);
						sampleStorageDetail.setSampleOPComment(OPComment);
						sampleStorageDetail.setSampleOPTime(time);
						sampleStorageDetail.setSampleOPType(OPType);
						samplemanageservice
								.addSampleStorageDetail(sampleStorageDetail);

					}

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				readwb.close();
			}
			return showAllSamples();
		} else {
			return "failed";
		}
	}

	public void exportExcel() throws Exception {
		if (request.getSession().getAttribute("account") != null) {

			// 获取输入文件
			String path = samplemanageservice.getExcelModel();
			// String path = "d:\\sampleDetail.xls";
			File file = new File(path);
			String fileName = file.getName();
			// 获取输入流
			InputStream inStream = new FileInputStream(path);
			InputStream in = new BufferedInputStream(inStream);
			byte[] bs = new byte[in.available()];
			in.read(bs);
			in.close();
			// 清空response
			response.reset();
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(fileName.getBytes(), "ISO-8859-1"));
			response.addHeader("Content-Length", "" + file.length());
			// 输出流
			OutputStream toClient = new BufferedOutputStream(
					response.getOutputStream());
			response.setContentType("application/octet-stream");
			toClient.write(bs);
			toClient.flush();
			toClient.close();
		} else {

		}
	}

	public SampleManageService getSamplemanageservice() {
		return samplemanageservice;
	}

	public void setSamplemanageservice(SampleManageService samplemanageservice) {
		this.samplemanageservice = samplemanageservice;
	}

	public String getDesignID() {
		return designID;
	}

	public void setDesignID(String designID) {
		this.designID = designID;
	}

	public String getSamplePlace() {
		return samplePlace;
	}

	public void setSamplePlace(String samplePlace) {
		this.samplePlace = samplePlace;
	}

	public String getSampleOPComment() {
		return sampleOPComment;
	}

	public void setSampleOPComment(String sampleOPComment) {
		this.sampleOPComment = sampleOPComment;
	}

	public String getSearchDesignCode() {
		return searchDesignCode;
	}

	public void setSearchDesignCode(String searchDesignCode) {
		this.searchDesignCode = searchDesignCode;
	}

	public String getSearchSamplePlace() {
		return searchSamplePlace;
	}

	public void setSearchSamplePlace(String searchSamplePlace) {
		this.searchSamplePlace = searchSamplePlace;
	}

	public String getSearchSampleState() {
		return searchSampleState;
	}

	public void setSearchSampleState(String searchSampleState) {
		this.searchSampleState = searchSampleState;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFilename() {
		return fileFilename;
	}

	public void setFileFilename(String fileFilename) {
		this.fileFilename = fileFilename;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

}
