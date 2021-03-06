package cn.edu.csu.dbhospital.dialog;

import org.eclipse.jface.dialogs.IDialogConstants;
import org.eclipse.jface.dialogs.TitleAreaDialog;
import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.layout.FormAttachment;
import org.eclipse.swt.layout.FormData;
import org.eclipse.swt.layout.FormLayout;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.widgets.Combo;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import cn.edu.csu.dbhospital.db.TCardManager;
import cn.edu.csu.dbhospital.db.TUserManager;
import cn.edu.csu.dbhospital.pojo.TCard;
import cn.edu.csu.dbhospital.pojo.TUser;
import cn.edu.csu.dbhospital.util.SystemUtil;
import org.eclipse.swt.widgets.Button;

public class TCardAddDialog extends TitleAreaDialog {
	private Text txt_realname;
	private Text txt_phone;
	private Combo cb_gander;
	private Text txt_card;

	/**
	 * Create the dialog.
	 * 
	 * @param parentShell
	 */
	public TCardAddDialog(Shell parentShell) {
		super(parentShell);
		setHelpAvailable(false);
	}

	/**
	 * Create contents of the dialog.
	 * 
	 * @param parent
	 */
	@Override
	protected Control createDialogArea(Composite parent) {
		setTitle("\u6DFB\u52A0\u8BCA\u7597\u5361");
		Composite area = (Composite) super.createDialogArea(parent);
		Composite container = new Composite(area, SWT.NONE);
		container.setLayout(new FormLayout());
		GridData gd_container = new GridData(GridData.FILL_BOTH);
		gd_container.widthHint = 341;
		container.setLayoutData(gd_container);

		Label label = new Label(container, SWT.NONE);
		FormData fd_label = new FormData();
		fd_label.top = new FormAttachment(0, 26);
		label.setLayoutData(fd_label);
		label.setText("\u7528\u6237\u59D3\u540D");

		txt_realname = new Text(container, SWT.BORDER);
		fd_label.right = new FormAttachment(txt_realname, -18);
		FormData fd_txt_realname = new FormData();
		fd_txt_realname.top = new FormAttachment(label, -3, SWT.TOP);
		fd_txt_realname.left = new FormAttachment(0, 98);
		fd_txt_realname.right = new FormAttachment(100, -36);
		txt_realname.setLayoutData(fd_txt_realname);

		Label label_2 = new Label(container, SWT.NONE);
		FormData fd_label_2 = new FormData();
		fd_label_2.top = new FormAttachment(label, 25);
		label_2.setLayoutData(fd_label_2);
		label_2.setText("\u7528\u6237\u6027\u522B");

		cb_gander = new Combo(container, SWT.NONE);
		fd_label_2.right = new FormAttachment(cb_gander, -18);
		FormData fd_cb_gander = new FormData();
		fd_cb_gander.right = new FormAttachment(0, 161);
		fd_cb_gander.top = new FormAttachment(txt_realname, 18);
		fd_cb_gander.left = new FormAttachment(0, 98);
		cb_gander.setLayoutData(fd_cb_gander);
		cb_gander.add(SystemUtil.GANSER_MALE);
		cb_gander.add(SystemUtil.GANSER_FEMALE);
		cb_gander.setData(SystemUtil.GANSER_FEMALE, SystemUtil.GANSER_FEMALE_VALUE);
		cb_gander.setData(SystemUtil.GANSER_MALE, SystemUtil.GANSER_MALE_VALUE);
		cb_gander.setText(SystemUtil.GANSER_MALE);

		Label label_5 = new Label(container, SWT.NONE);
		FormData fd_label_5 = new FormData();
		fd_label_5.top = new FormAttachment(label_2, 27);
		fd_label_5.left = new FormAttachment(label, 0, SWT.LEFT);
		label_5.setLayoutData(fd_label_5);
		label_5.setText("\u8EAB\u4EFD\u8BC1\u53F7");

		txt_card = new Text(container, SWT.BORDER);
		FormData fd_txt_card = new FormData();
		fd_txt_card.top = new FormAttachment(label_5, -3, SWT.TOP);
		fd_txt_card.right = new FormAttachment(txt_realname, 0, SWT.RIGHT);
		fd_txt_card.left = new FormAttachment(txt_realname, 0, SWT.LEFT);
		txt_card.setLayoutData(fd_txt_card);

		Label label_3 = new Label(container, SWT.NONE);
		FormData fd_label_3 = new FormData();
		fd_label_3.top = new FormAttachment(label_5, 33);
		fd_label_3.left = new FormAttachment(label, 0, SWT.LEFT);
		label_3.setLayoutData(fd_label_3);
		label_3.setText("\u8054\u7CFB\u65B9\u5F0F");

		txt_phone = new Text(container, SWT.BORDER);
		FormData fd_txt_phone = new FormData();
		fd_txt_phone.top = new FormAttachment(label_3, -3, SWT.TOP);
		fd_txt_phone.right = new FormAttachment(txt_realname, 0, SWT.RIGHT);
		fd_txt_phone.left = new FormAttachment(txt_realname, 0, SWT.LEFT);
		txt_phone.setLayoutData(fd_txt_phone);

		return area;
	}

	/**
	 * Create contents of the button bar.
	 * 
	 * @param parent
	 */
	@Override
	protected void createButtonsForButtonBar(Composite parent) {
		Button button = createButton(parent, IDialogConstants.OK_ID, "\u4FEE\u6539", true);
		button.setText("\u6DFB\u52A0");
		createButton(parent, IDialogConstants.CANCEL_ID, "\u53D6\u6D88", false);
	}

	@Override
	protected void buttonPressed(int buttonId) {
		if (buttonId == IDialogConstants.OK_ID) {
			if ("".equalsIgnoreCase(txt_realname.getText()) || "".equalsIgnoreCase(txt_phone.getText())
					|| "".equalsIgnoreCase(cb_gander.getText()) || "".equalsIgnoreCase(txt_card.getText())) {
				setMessage("所有信息都不能为空");
				return;
			}
			TCardManager cardManager = new TCardManager();
			TCard card = new TCard();
			card.setCardnum(SystemUtil.buildCardNumber());

			TUserManager userManager = new TUserManager();
			TUser user = new TUser();
			user.setRealname(txt_realname.getText());
			user.setGander((int) (cb_gander.getData(cb_gander.getText())));
			user.setPhone(txt_phone.getText());
			user.setCard(txt_card.getText());
			user.setCardnum(card.getCardnum());
			try {
				userManager.addCardUser(user);
				user = userManager.searchByCardnum(card.getCardnum());
				card.setUserId(user.getId());
				cardManager.add(card);
			} catch (Exception e) {
				e.printStackTrace();
				setReturnCode(SystemUtil.RESULT_FAIL);
				close();
			}
			okPressed();
		} else {
			cancelPressed();
		}
	}

	/**
	 * Return the initial size of the dialog.
	 */
	@Override
	protected Point getInitialSize() {
		return new Point(350, 369);
	}
}
