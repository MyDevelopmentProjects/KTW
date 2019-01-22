package ge.mgl.configuration;

import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.MimeMappings;
import org.springframework.stereotype.Component;

@Component
public class ContentTyoeResolver  implements EmbeddedServletContainerCustomizer {

    @Override
    public void customize(ConfigurableEmbeddedServletContainer container) {
         MimeMappings mappings = new MimeMappings(MimeMappings.DEFAULT);
        mappings.add("webm", "video/webm");
        mappings.add("mp4", "video/mp4");
        container.setMimeMappings(mappings);
    }
}
