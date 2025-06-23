import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

/**
 * 이미지 업로드 유틸리티 클래스
 * 다중 이미지 업로드 처리
 * 
 * @author JUPJUP Market
 */
public class ImageUploadUtil {
    
    // 허용되는 이미지 확장자
    private static final String[] ALLOWED_EXTENSIONS = {
        ".jpg", ".jpeg", ".png", ".gif", ".bmp", ".webp"
    };
    
    // 최대 파일 크기 (5MB)
    private static final long MAX_FILE_SIZE = 5 * 1024 * 1024;
    
    // 최대 업로드 개수
    private static final int MAX_UPLOAD_COUNT = 8;
    
    /**
     * 다중 이미지 업로드 처리
     * 
     * @param request HttpServletRequest 객체
     * @param uploadDir 업로드 디렉토리 (예: "sellImages", "buyImages", "commuImages")
     * @return 업로드된 파일명 리스트
     * @throws IOException
     */
    public static List<String> uploadImages(HttpServletRequest request, String uploadDir) throws IOException {
        List<String> uploadedFiles = new ArrayList<>();
        
        try {
            // 업로드 디렉토리 경로 설정
            String contextPath = request.getServletContext().getRealPath("");
            String uploadPath = contextPath + File.separator + "uploads" + File.separator + uploadDir;
            
            // 디렉토리 생성
            File uploadDirFile = new File(uploadPath);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdirs();
            }
            
            // 이미지 파일들 처리
            for (Part part : request.getParts()) {
                if (part.getName().equals("images") && part.getSize() > 0) {
                    
                    // 파일 크기 검증
                    if (part.getSize() > MAX_FILE_SIZE) {
                        throw new IOException("파일 크기가 5MB를 초과합니다: " + part.getSubmittedFileName());
                    }
                    
                    String fileName = part.getSubmittedFileName();
                    
                    // 파일 확장자 검증
                    if (!isAllowedExtension(fileName)) {
                        throw new IOException("허용되지 않는 파일 형식입니다: " + fileName);
                    }
                    
                    // 업로드 개수 제한
                    if (uploadedFiles.size() >= MAX_UPLOAD_COUNT) {
                        break;
                    }
                    
                    // 고유한 파일명 생성
                    String fileExtension = getFileExtension(fileName);
                    String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
                    
                    // 파일 저장
                    String filePath = uploadPath + File.separator + uniqueFileName;
                    part.write(filePath);
                    
                    uploadedFiles.add(uniqueFileName);
                }
            }
            
        } catch (Exception e) {
            throw new IOException("이미지 업로드 중 오류가 발생했습니다: " + e.getMessage());
        }
        
        return uploadedFiles;
    }
    
    /**
     * 파일 확장자 검증
     * 
     * @param fileName 파일명
     * @return 허용 여부
     */
    private static boolean isAllowedExtension(String fileName) {
        if (fileName == null || fileName.trim().isEmpty()) {
            return false;
        }
        
        String lowerFileName = fileName.toLowerCase();
        for (String ext : ALLOWED_EXTENSIONS) {
            if (lowerFileName.endsWith(ext)) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * 파일 확장자 추출
     * 
     * @param fileName 파일명
     * @return 확장자 (점 포함)
     */
    private static String getFileExtension(String fileName) {
        if (fileName == null || fileName.trim().isEmpty()) {
            return "";
        }
        
        int lastIndexOf = fileName.lastIndexOf(".");
        if (lastIndexOf == -1) {
            return "";
        }
        return fileName.substring(lastIndexOf);
    }
    
    /**
     * 파일 삭제
     * 
     * @param request HttpServletRequest 객체
     * @param uploadDir 업로드 디렉토리
     * @param fileName 삭제할 파일명
     * @return 삭제 성공 여부
     */
    public static boolean deleteImage(HttpServletRequest request, String uploadDir, String fileName) {
        try {
            String contextPath = request.getServletContext().getRealPath("");
            String filePath = contextPath + File.separator + "uploads" + File.separator + uploadDir + File.separator + fileName;
            
            File file = new File(filePath);
            if (file.exists()) {
                return file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /**
     * 파일명 리스트를 JSON 문자열로 변환
     * 
     * @param fileNames 파일명 리스트
     * @return JSON 문자열
     */
    public static String listToJson(List<String> fileNames) {
        if (fileNames == null || fileNames.isEmpty()) {
            return "[]";
        }
        
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < fileNames.size(); i++) {
            if (i > 0) {
                json.append(",");
            }
            json.append("\"").append(fileNames.get(i)).append("\"");
        }
        json.append("]");
        
        return json.toString();
    }
    
    /**
     * JSON 문자열을 파일명 리스트로 변환
     * 
     * @param jsonString JSON 문자열
     * @return 파일명 리스트
     */
    public static List<String> jsonToList(String jsonString) {
        List<String> fileNames = new ArrayList<>();
        
        if (jsonString == null || jsonString.trim().isEmpty() || jsonString.equals("[]")) {
            return fileNames;
        }
        
        try {
            // 간단한 JSON 파싱 (라이브러리 없이)
            String cleaned = jsonString.replace("[", "").replace("]", "").replace("\"", "");
            if (!cleaned.trim().isEmpty()) {
                String[] files = cleaned.split(",");
                for (String file : files) {
                    if (!file.trim().isEmpty()) {
                        fileNames.add(file.trim());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return fileNames;
    }
} 