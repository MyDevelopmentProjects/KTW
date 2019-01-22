
package ge.mgl.entities;

import javax.persistence.*;

@Entity
@Table(name = "H_main")

public class HMain extends SuperModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

}