package net.xndk.agenda.infra;

import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.boot.model.naming.Identifier;
import org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl;
import org.hibernate.engine.jdbc.env.spi.IdentifierHelper;
import org.hibernate.engine.jdbc.env.spi.JdbcEnvironment;

public class HibernateNamingStrategy extends PhysicalNamingStrategyStandardImpl {
	private static final long serialVersionUID = 432198590159824619L;

	@Override
	public Identifier toPhysicalTableName(Identifier name, JdbcEnvironment context) {
		String newName = "tb_" + camelCaseToSnakeCase(name.getText());
		IdentifierHelper identifierHelper = context.getIdentifierHelper();
		return identifierHelper.toIdentifier(newName, name.isQuoted());
	}

	private String camelCaseToSnakeCase(String name) {
		List<String> result = new LinkedList<>();
		for (String part : StringUtils.splitByCharacterTypeCamelCase(name)) {
			if (part == null || part.trim().isEmpty()) {
				// skip null and space
				continue;
			}
			if (part.equals("_")) {
				part = "";
			}
			result.add(part.toLowerCase(Locale.ROOT));
		}
		return StringUtils.join(result, "_");
	}
}
