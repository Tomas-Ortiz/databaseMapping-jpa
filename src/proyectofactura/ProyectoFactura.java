package proyectofactura;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ProyectoFactura {

    public static void main(String[] args) {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("proyectoFacturaPU");

        EntityManager em = emf.createEntityManager();

    }

}
