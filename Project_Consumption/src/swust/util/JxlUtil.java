package swust.util;

import java.io.File;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Vector;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class JxlUtil<T> {
	public void toExcel(String savePath, String sheetName,
			Vector<String> columnNames, Vector<String> reallyColumnNames,
			List<T> list) {
		WritableWorkbook workbook = null;
		WritableSheet sheet = null;
		int rowNum = 0;
		try {
			workbook = Workbook.createWorkbook(new File(savePath));
			sheet = workbook.createSheet(sheetName, 0);
			write(sheet, columnNames, rowNum);
			rowNum++;
			int listSize = list.size();
			for (int i = 0; i < listSize; i++) {
				Vector<String> dataColumns = new Vector<String>();
				T t = (T) list.get(i);
				// System.out.println(t);
				Method[] methods = t.getClass().getMethods();
				for (int j = 0; j < reallyColumnNames.size(); j++) {
					String reallyColumnName = reallyColumnNames.get(j);
					// if (reallyColumnName.contains(".")) {
					// String temp[] = reallyColumnName.split("\\.");
					// reallyColumnName = ((char) (temp[0].charAt(0) - 32))
					// + temp[0].substring(1);
					// String reallyColumnName2 = ((char) (temp[1].charAt(0) -
					// 32))
					// + temp[1].substring(1);
					//
					// String methodName = "get" + reallyColumnName;
					// String methodName2 = "get" + reallyColumnName2;
					//
					// for (int k = 0; k < methods.length; k++) {
					// Method method = methods[k];
					// System.out.println("method:" + methods[k]);
					// // System.out.println("mthodName:" + methodName);
					// // System.out.println("methodName.getName():"
					// // + method.getName());
					// String finalMethodName = method.getName()
					// + methodName2 + "()";
					// if (finalMethodName.equals(method.getName()
					// + methodName2 + "()")) {
					// dataColumns.add(method.invoke(t).toString());
					// }
					// }
					//
					// } else {
					reallyColumnName = ((char) (reallyColumnName.charAt(0) - 32))
							+ reallyColumnName.substring(1);
					String methodName = "get" + reallyColumnName;
					for (int k = 0; k < methods.length; k++) {
						Method method = methods[k];
						// System.out.println(method);
						if (methodName.equals(method.getName())) {
							dataColumns.add(method.invoke(t).toString());
						}
					}
					// }

				}
				write(sheet, dataColumns, rowNum);
				rowNum++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				workbook.write();
				workbook.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void write(WritableSheet sheet, Vector<String> columnNames,
			int rowNum) throws RowsExceededException, WriteException {
		int size = columnNames.size();
		for (int i = 0; i < size; i++) {
			Label label = new Label(i, rowNum, columnNames.get(i));
			sheet.addCell(label);
		}
	}
}
