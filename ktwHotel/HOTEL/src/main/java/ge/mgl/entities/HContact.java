
package ge.mgl.entities;

import javax.persistence.*;

@Entity
@Table(name = "H_contact")

public class HContact extends SuperModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

}