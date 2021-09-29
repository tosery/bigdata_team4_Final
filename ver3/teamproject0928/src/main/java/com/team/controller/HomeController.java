package com.team.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.team.domain.Covid19DTO;


@Controller
public class HomeController {
	
	@GetMapping(value = { "/", "/index" })
	public String home(
			@RequestParam(required = false, defaultValue = "1") String pageNo,
			@RequestParam(required = false, defaultValue = "10") String numOfRows,
			@RequestParam(required = false, defaultValue = "20200610") String startCreateDt,
			@RequestParam(required = false, defaultValue = "20200615") String endCreateDt,
			Model model) throws Exception{
		// GET ��û
		// http://localhost:8090/
			List<Covid19DTO> covidList = getCovid19Inf(pageNo, numOfRows, startCreateDt, endCreateDt);
		
			model.addAttribute("covidList", covidList);
		
		System.out.println("home() ȣ���...");
		
		return "index"; // ������ jsp �� �̸��� ������
	}
	
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getImageFile(String fileName) throws IOException {
		System.out.println("fileName : " + fileName);
		
		File file = new File("C:/sye/upload", fileName);
		System.out.println("���� �̹��� ���� ��� : " + file.getPath());
		
		
		HttpHeaders headers = new HttpHeaders();
		
		String contentType = Files.probeContentType(file.toPath());
		headers.add("Content-Type", contentType); // "image/jpeg"  "image/png"
		
		byte[] imageData = FileCopyUtils.copyToByteArray(file);
		
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(imageData, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName) throws UnsupportedEncodingException {
		System.out.println("fileName : " + fileName);
		
		File file = new File("C:/sye/upload", fileName);
		
		Resource resource = new FileSystemResource(file);
		System.out.println("resource : " + resource);
		
		if (resource.exists() == false) { // �ٿ�ε��� ������ �������� ������
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND); // �ڿ� ���� �����ڵ�� ���亸���� ����
		}
		
		// �ٿ�ε��� ������ �����ϸ�
		
		String resourceName = resource.getFilename();
		System.out.println("resourceName : " + resourceName);
		
		int beginIndex = resourceName.indexOf("_") + 1;
		String originFilename = resourceName.substring(beginIndex); // ���� ���ϸ� ���ϱ�
		System.out.println("originFilename : " + originFilename);
		
		String downloadName = new String(originFilename.getBytes("UTF-8"), "ISO-8859-1"); // �ٿ�ε� ���ϸ����� ��ȯ�ϱ�
		System.out.println("downloadName : " + downloadName);
		
		HttpHeaders headers = new HttpHeaders();
		//headers.add("Content-Type", "application/octet-stream"); // �ֳ����̼��� produces �Ӽ����� ��ü
		headers.add("Content-Disposition", "attachment; filename=" + downloadName); // �ٿ�ε� ���ϸ��� ����� �����ϱ�
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@GetMapping("/covid19")
	public String covid19Service(
			@RequestParam(required = false, defaultValue = "1") String pageNo,
			@RequestParam(required = false, defaultValue = "10") String numOfRows,
			@RequestParam(required = false, defaultValue = "20200610") String startCreateDt,
			@RequestParam(required = false, defaultValue = "20200615") String endCreateDt,
			Model model) throws Exception {
		
		List<Covid19DTO> covidList = getCovid19Inf(pageNo, numOfRows, startCreateDt, endCreateDt);
		
		model.addAttribute("covidList", covidList);
		
		return "covid19Info";
	} // covid19Service

	
	private List<Covid19DTO> getCovid19Inf(String pageNo, String numOfRows, String startCreateDt, String endCreateDt) throws Exception {
		
		List<Covid19DTO> covidList = new ArrayList<Covid19DTO>(); // ������ List �غ�
		
		// ������ ������ ��û�ּ� �����
		StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=5HDLlx8mwCkPRBBcL2BAfV3aD5z6KN2kKQw7ng9F22KlLdcco8dvSssRCrVFYWOJt%2FYpBYraniXrMRBQU%2BZExQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*��������ȣ*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); /*�� ������ ��� ��*/
        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(startCreateDt, "UTF-8")); /*�˻��� ������ ������ ����*/
        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(endCreateDt, "UTF-8")); /*�˻��� ������ ������ ����*/
        
		// ���� ������ ��û�ּҸ� ���� ������ XML ������ �ڹ� ������Ʈ�� �Ľ��ϴ� �ڵ���.
		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newDefaultInstance();
		DocumentBuilder builder = builderFactory.newDocumentBuilder(); // DocumentBuilder�� XML �ļ��̴�.
		
		Document document = builder.parse(urlBuilder.toString()); // ��û�ּҸ� DocumentBuilder�� ���ڷ� �����ϸ� XML ������ Document ��ü�� ���Ϲ���.
		document.getDocumentElement().normalize();
		System.out.println("Root Element : " + document.getDocumentElement().getNodeName());
		
		NodeList nodeList = document.getElementsByTagName("item"); // ������� �ݺ��Ǵ� item �±׸��� �������� NodeList ������.
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SS"); // Date ��ü�� �Ľ��� SimpleDateFormat �غ�.
		
		// �ʿ��� �����͸� DTO�� ��Ƽ� �غ�� covidList�� �߰��ϱ�
		for (int i=0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			System.out.println("Current Element : " + node.getNodeName());
			
			if (node.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) node;  // item ���(Element)
				Covid19DTO covidDto = new Covid19DTO();
				
				String accDefRate = element.getElementsByTagName("accDefRate").item(0).getTextContent();
				covidDto.setAccDefRate(Double.parseDouble(accDefRate));
				
				String accExamCnt = element.getElementsByTagName("accExamCnt").item(0).getTextContent();
				covidDto.setAccExamCnt(Integer.parseInt(accExamCnt));
				
				String accExamCompCnt = element.getElementsByTagName("accExamCompCnt").item(0).getTextContent();
				covidDto.setAccExamCompCnt(Integer.parseInt(accExamCompCnt));
				
				String careCnt = element.getElementsByTagName("careCnt").item(0).getTextContent();
				covidDto.setCareCnt(Integer.parseInt(careCnt));
				
				String clearCnt = element.getElementsByTagName("clearCnt").item(0).getTextContent();
				covidDto.setClearCnt(Integer.parseInt(clearCnt));
				
				String createDt = element.getElementsByTagName("createDt").item(0).getTextContent();
				covidDto.setCreateDt(sdf.parse(createDt));
				
				String deathCnt = element.getElementsByTagName("deathCnt").item(0).getTextContent();
				covidDto.setDeathCnt(Integer.parseInt(deathCnt));
				
				String decideCnt = element.getElementsByTagName("decideCnt").item(0).getTextContent();
				covidDto.setDecideCnt(Integer.parseInt(decideCnt));
				
				String examCnt = element.getElementsByTagName("examCnt").item(0).getTextContent();
				covidDto.setExamCnt(Integer.parseInt(examCnt));
				
				String resutlNegCnt = element.getElementsByTagName("resutlNegCnt").item(0).getTextContent();
				covidDto.setResutlNegCnt(Integer.parseInt(resutlNegCnt));
				
				String seq = element.getElementsByTagName("seq").item(0).getTextContent();
				covidDto.setSeq(Integer.parseInt(seq));
				
				String stateDt = element.getElementsByTagName("stateDt").item(0).getTextContent();
				covidDto.setStateDt(stateDt);
				
				String stateTime = element.getElementsByTagName("stateTime").item(0).getTextContent();
				covidDto.setStateTime(stateTime);
				
				String updateDt = element.getElementsByTagName("updateDt").item(0).getTextContent();
				covidDto.setUpdateDt(sdf.parse(updateDt));
				
				covidList.add(covidDto); // ����Ʈ�� DTO�� �߰�
			} // if
		} // for
		
		System.out.println("�Ľ̰�� : " + covidList);
        
		return covidList; // �Ľ̵� List�� ����
	} // getCovid19XmlData
	
}