package hcmute.edu.vn.model;

import lombok.Builder;

@Builder
public record MailBody(String to, String subject, String text) {

}
